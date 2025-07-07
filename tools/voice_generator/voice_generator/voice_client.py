"""Client for interacting with Eleven Labs API."""

import os
import time
from typing import Optional, List, Dict
from elevenlabs.client import ElevenLabs
from .constants import (
    DEFAULT_VOICE_MODEL,
    DEFAULT_OUTPUT_FORMAT,
    RATE_LIMIT_DELAY,
    MAX_RETRIES,
    RETRY_DELAY
)


class VoiceClient:
    """Client for generating voice files using Eleven Labs API."""

    def __init__(self, api_key: str, voice_id: Optional[str] = None):
        """Initialize the voice client.

        Args:
            api_key: Eleven Labs API key
            voice_id: Optional voice ID to use for generation
        """
        self.api_key = api_key
        self.voice_id = voice_id
        self.client = ElevenLabs(api_key=api_key)

        # Get voice model from environment or use default
        self.model = os.getenv('ELEVENLABS_MODEL', DEFAULT_VOICE_MODEL)
        self.output_format = os.getenv('ELEVENLABS_OUTPUT_FORMAT', DEFAULT_OUTPUT_FORMAT)

    def list_voices(self) -> List[Dict]:
        """List all available voices.

        Returns:
            List of voice dictionaries with id, name, and other metadata
        """
        try:
            response = self.client.voices.get_all()
            voice_list = []

            for voice in response.voices:
                voice_list.append({
                    'id': voice.voice_id,
                    'name': voice.name,
                    'category': voice.category if hasattr(voice, 'category') else 'custom',
                    'description': voice.description if hasattr(voice, 'description') else None,
                    'labels': voice.labels if hasattr(voice, 'labels') else {},
                })

            return voice_list
        except Exception as e:
            print(f"Failed to list voices: {e}")
            return []

    def find_voice_by_name(self, name: str) -> Optional[str]:
        """Find a voice ID by name.

        Args:
            name: Voice name to search for (case-insensitive)

        Returns:
            Voice ID if found, None otherwise
        """
        available_voices = self.list_voices()
        name_lower = name.lower()

        for voice in available_voices:
            if voice['name'].lower() == name_lower:
                return voice['id']

        # Try partial match
        for voice in available_voices:
            if name_lower in voice['name'].lower():
                return voice['id']

        return None

    def generate_speech(
        self,
        text: str,
        voice_id: Optional[str] = None,
        output_path: Optional[str] = None
    ) -> Optional[bytes]:
        """Generate speech from text.

        Args:
            text: Text to convert to speech
            voice_id: Voice ID to use (overrides instance default)
            output_path: Optional path to save the audio file

        Returns:
            Audio data as bytes, or None if generation failed
        """
        voice_to_use = voice_id or self.voice_id
        if not voice_to_use:
            raise ValueError("No voice ID provided")

        # Retry logic for API calls
        for attempt in range(MAX_RETRIES):
            try:
                # Generate audio using the new API
                audio_generator = self.client.text_to_speech.convert(
                    text=text,
                    voice_id=voice_to_use,
                    model_id=self.model
                )

                # For the generator API, we need to consume it
                audio_chunks = []
                for chunk in audio_generator:
                    audio_chunks.append(chunk)

                # Combine chunks into single bytes object
                audio_data = b''.join(audio_chunks)

                # Save to file if path provided
                if output_path:
                    os.makedirs(os.path.dirname(output_path), exist_ok=True)
                    with open(output_path, 'wb') as f:
                        f.write(audio_data)

                # Rate limiting
                time.sleep(RATE_LIMIT_DELAY)

                return audio_data

            except Exception as e:
                if attempt < MAX_RETRIES - 1:
                    print(f"API call failed (attempt {attempt + 1}/{MAX_RETRIES}): {e}")
                    time.sleep(RETRY_DELAY)
                else:
                    print(f"Failed to generate speech after {MAX_RETRIES} attempts: {e}")
                    return None

    def generate_batch(
        self,
        text_list: List[Dict[str, str]],
        voice_id: Optional[str] = None,
        progress_callback=None
    ) -> Dict[str, bool]:
        """Generate multiple speech files in batch.

        Args:
            text_list: List of dicts with 'text' and 'output_path' keys
            voice_id: Voice ID to use for all generations
            progress_callback: Optional callback function(current, total, text)

        Returns:
            Dictionary mapping output paths to success status
        """
        results = {}
        total = len(text_list)

        for i, item in enumerate(text_list):
            text = item.get('text', '')
            output_path = item.get('output_path', '')

            if progress_callback:
                progress_callback(i + 1, total, text)

            if not text or not output_path:
                results[output_path] = False
                continue

            # Generate the speech
            audio_data = self.generate_speech(text, voice_id, output_path)
            results[output_path] = audio_data is not None

        return results

    def get_voice_settings(self, voice_id: str) -> Optional[Dict]:
        """Get settings for a specific voice.

        Args:
            voice_id: Voice ID to get settings for

        Returns:
            Voice settings dictionary or None
        """
        try:
            voice = self.client.voices.get(voice_id)
            if voice and hasattr(voice, 'settings'):
                settings = voice.settings
                return {
                    'stability': getattr(settings, 'stability', None),
                    'similarity_boost': getattr(settings, 'similarity_boost', None),
                    'style': getattr(settings, 'style', None),
                    'use_speaker_boost': getattr(settings, 'use_speaker_boost', None),
                }
            return None
        except Exception as e:
            print(f"Failed to get voice settings: {e}")
            return None
