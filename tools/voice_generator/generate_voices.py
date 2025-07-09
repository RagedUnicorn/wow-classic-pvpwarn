#!/usr/bin/env python3
"""Generate voice files for PVPWarn addon using Eleven Labs API."""

import os
import sys
import argparse
from typing import Optional, List, Dict
from dotenv import load_dotenv

# Add the current directory to the Python path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from voice_generator import (
    LuaParser,
    VoiceClient,
    FileManager,
    Reporter,
    ALLOWED_LANGUAGE_MODELS
)


def setup_environment() -> Dict[str, str]:
    """Load environment variables and validate configuration.

    Returns:
        Dictionary with configuration values
    """
    # Load .env file
    load_dotenv()

    # Get required API key
    api_key = os.getenv('ELEVENLABS_API_KEY')
    if not api_key:
        raise ValueError("ELEVENLABS_API_KEY not found in environment variables")

    # Get optional settings
    config = {
        'api_key': api_key,
        'voice_id': os.getenv('ELEVENLABS_VOICE_ID'),
        'model': os.getenv('ELEVENLABS_MODEL'),
        'output_format': os.getenv('ELEVENLABS_OUTPUT_FORMAT'),
    }

    return config


def generate_single_file(
    client: VoiceClient,
    file_manager: FileManager,
    voice_id: str,
    sound_file_name: str,
    text: str,
    category: Optional[str] = None
) -> bool:
    """Generate a single voice file.

    Args:
        client: Voice client instance
        file_manager: File manager instance
        voice_id: Voice ID to use
        sound_file_name: Name of the sound file to generate
        text: Text to speak
        category: Optional category for organizing the file

    Returns:
        True if successful
    """
    print(f"\nGenerating: {sound_file_name} -> \"{text}\"")
    if category:
        print(f"Category: {category}")

    # Ensure category directory exists
    if category:
        file_manager.ensure_category_directory(category)

    # Get output path
    output_path = file_manager.get_output_file_path(sound_file_name, category)

    # Generate the voice
    result = client.generate_speech(text, voice_id, output_path)

    if result:
        print(f"[+] Generated successfully: {output_path}")
        return True
    else:
        print(f"[X] Failed to generate: {sound_file_name}")
        return False


def generate_all_voices(
    client: VoiceClient,
    parser: LuaParser,
    file_manager: FileManager,
    reporter: Reporter,
    voice_id: str,
    force: bool = False,
    categories: Optional[List[str]] = None
) -> None:
    """Generate all voice files from the SpellMap.

    Args:
        client: Voice client instance
        parser: Lua parser instance
        file_manager: File manager instance
        reporter: Reporter instance
        voice_id: Voice ID to use
        force: Force regeneration of existing files
        categories: Optional list of categories to filter
    """
    # Get voice files with their text content
    voice_files = parser.get_voice_files_with_text(categories)
    total_files = len(voice_files)

    reporter.start_generation(total_files)

    # Check existing files
    if not force:
        existing_files_by_category = file_manager.list_existing_files()
    else:
        existing_files_by_category = {}

    # Process each file
    for i, voice_data in enumerate(voice_files):
        sound_file = voice_data['file_name']
        text = voice_data['text']
        category = voice_data.get('category', '')
        subcategory = voice_data.get('subcategory', '')

        reporter.report_progress(i + 1, total_files, sound_file)

        # Check if file exists in its category/subcategory
        if category in existing_files_by_category:
            category_data = existing_files_by_category[category]
            subcategory_files = category_data.get(subcategory, set())
            if sound_file in subcategory_files and not force:
                reporter.report_file_result(sound_file, 'skipped')
                continue

        # Ensure category/subcategory directory exists
        if category:
            file_manager.ensure_category_directory(category, subcategory)

        # Generate the voice
        try:
            output_path = file_manager.get_output_file_path(sound_file, category, subcategory)

            result = client.generate_speech(text, voice_id, output_path)

            if result:
                reporter.report_file_result(sound_file, 'generated')
            else:
                reporter.report_file_result(sound_file, 'failed', 'Generation failed')

        except Exception as e:
            reporter.report_file_result(sound_file, 'failed', str(e))

    # Print summary
    reporter.print_summary()


def main():
    """Main entry point."""
    parser = argparse.ArgumentParser(
        description="Generate voice files for PVPWarn addon using Eleven Labs API"
    )

    parser.add_argument(
        'mode',
        choices=['single', 'all'],
        help="Generation mode: 'single' for one file, 'all' for all spells"
    )

    parser.add_argument(
        '--file',
        help="Sound file name to generate (for single mode)"
    )

    parser.add_argument(
        '--text',
        help="Text to speak (required for single mode)"
    )

    parser.add_argument(
        '--category',
        help="Category for organizing the file (e.g., 'rogue', 'warrior')"
    )

    parser.add_argument(
        '--voice',
        help="Voice name to use (e.g., 'Julie US')"
    )

    parser.add_argument(
        '--voice-id',
        help="Voice ID to use (overrides --voice)"
    )

    parser.add_argument(
        '--force',
        action='store_true',
        help="Force regeneration of existing files"
    )

    parser.add_argument(
        '--output',
        help="Custom output directory"
    )

    parser.add_argument(
        '--clean',
        action='store_true',
        help="Clean output directory before generation"
    )

    parser.add_argument(
        '--categories',
        nargs='+',
        help="Generate only specific categories (e.g., warrior priest druid items racials)"
    )

    parser.add_argument(
        '--model',
        choices=ALLOWED_LANGUAGE_MODELS,
        help=f"Eleven Labs model to use for generation. Choices: {', '.join(ALLOWED_LANGUAGE_MODELS)}"
    )

    args = parser.parse_args()

    try:
        # Setup environment
        config = setup_environment()

        # Initialize components
        lua_parser = LuaParser()
        file_manager = FileManager(
            output_path=args.output
        )
        reporter = Reporter(verbose=True)

        # Ensure directories exist
        file_manager.ensure_output_directory()

        # Initialize voice client
        client = VoiceClient(
            api_key=config['api_key'],
            voice_id=config.get('voice_id'),
            model=args.model
        )

        # Determine voice ID
        if args.voice_id:
            voice_id = args.voice_id
        elif args.voice:
            voice_id = client.find_voice_by_name(args.voice)
            if not voice_id:
                print(f"Error: Voice '{args.voice}' not found")
                sys.exit(1)
        elif config.get('voice_id'):
            voice_id = config['voice_id']
        else:
            print("Error: No voice specified. Use --voice or --voice-id, or set ELEVENLABS_VOICE_ID in .env")
            sys.exit(1)

        # Build complete configuration
        full_config = {
            'mode': args.mode,
            'voice_id': voice_id,
            'model': client.model,
            'output_format': client.output_format,
            'force': args.force,
            'output': file_manager.output_path,
            'categories': args.categories if args.categories else 'all',
        }
        
        # Add voice settings if configured
        if client.voice_settings:
            if client.voice_settings.get('stability') is not None:
                full_config['stability'] = client.voice_settings.get('stability')
            if client.voice_settings.get('similarity_boost') is not None:
                full_config['similarity_boost'] = client.voice_settings.get('similarity_boost')
            if client.voice_settings.get('style') is not None:
                full_config['style'] = client.voice_settings.get('style')
            if client.voice_settings.get('use_speaker_boost') is not None:
                full_config['use_speaker_boost'] = client.voice_settings.get('use_speaker_boost')
        
        # Log configuration
        reporter.log_configuration(full_config)

        # Handle clean if requested
        if args.clean:
            count = file_manager.clean_output_directory()
            print(f"Removed {count} existing files")

        # Execute based on mode
        if args.mode == 'single':
            if not args.file:
                print("Error: --file is required for single mode")
                sys.exit(1)

            if not args.text:
                print("Error: --text is required for single mode")
                sys.exit(1)

            success = generate_single_file(
                client, file_manager,
                voice_id, args.file, args.text,
                category=args.category
            )
            sys.exit(0 if success else 1)

        else:  # all mode
            generate_all_voices(
                client, lua_parser,
                file_manager, reporter, voice_id,
                force=args.force,
                categories=args.categories
            )

    except KeyboardInterrupt:
        print("\n\nGeneration cancelled by user")
        sys.exit(1)
    except Exception as e:
        import traceback
        print(f"\nError: {e}")
        traceback.print_exc()
        sys.exit(1)


if __name__ == "__main__":
    main()
