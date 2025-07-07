"""Reporter for tracking and displaying voice generation progress."""

import time
from typing import Dict, Optional
from datetime import datetime, timedelta


class Reporter:
    """Handles progress reporting and result summary for voice generation."""

    def __init__(self, verbose: bool = True):
        """Initialize the reporter.

        Args:
            verbose: Whether to show detailed progress
        """
        self.verbose = verbose
        self.start_time = None
        self.results = {
            'generated': [],
            'failed': [],
            'skipped': []
        }

    def start_generation(self, total_files: int) -> None:
        """Mark the start of voice generation.

        Args:
            total_files: Total number of files to generate
        """
        self.start_time = time.time()
        self.total_files = total_files

        if self.verbose:
            print(f"\n{'='*60}")
            print(f"Starting voice generation for {total_files} files")
            print(f"Time: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
            print(f"{'='*60}\n")

    def report_progress(self, current: int, total: int, file_name: str, status: str = "generating") -> None:
        """Report progress for a single file.

        Args:
            current: Current file number
            total: Total number of files
            file_name: Name of the current file
            status: Status of the operation
        """
        if not self.verbose:
            return

        # Calculate progress percentage
        percentage = (current / total * 100) if total > 0 else 0

        # Create progress bar
        bar_width = 30
        filled = int(bar_width * current / total) if total > 0 else 0
        bar = '#' * filled + '-' * (bar_width - filled)

        # Estimate time remaining
        if self.start_time and current > 0:
            elapsed = time.time() - self.start_time
            if elapsed > 0:
                rate = current / elapsed
                remaining = (total - current) / rate if rate > 0 else 0
                eta = f"ETA: {timedelta(seconds=int(remaining))}"
            else:
                eta = "ETA: calculating..."
        else:
            eta = "ETA: calculating..."

        # Print progress line
        status_str = f"[{current}/{total}] {bar} {percentage:.1f}% - {status}: {file_name} - {eta}"
        print(f"\r{status_str}", end='', flush=True)

    def report_file_result(self, file_name: str, result: str, error: Optional[str] = None) -> None:
        """Report the result of generating a single file.

        Args:
            file_name: Name of the file
            result: Result status ('generated', 'failed', 'skipped')
            error: Optional error message for failed files
        """
        # Track result
        if result in self.results:
            self.results[result].append({
                'file': file_name,
                'error': error,
                'time': datetime.now()
            })

        # Clear the progress line before printing result
        if self.verbose:
            # Use a longer clear string to ensure complete clearing
            print('\r' + ' ' * 120 + '\r', end='', flush=True)

            # Print result with appropriate formatting
            if result == 'generated':
                print(f"[+] Generated: {file_name}")
            elif result == 'failed':
                print(f"[X] Failed: {file_name} - {error or 'Unknown error'}")
            elif result == 'skipped':
                print(f"[=] Already exists: {file_name}")

    def print_summary(self) -> None:
        """Print a summary of the generation results."""
        if not self.start_time:
            return

        total_time = time.time() - self.start_time

        print(f"\n{'='*60}")
        print("Voice Generation Summary")
        print(f"{'='*60}")

        # Count results
        generated = len(self.results['generated'])
        failed = len(self.results['failed'])
        skipped = len(self.results['skipped'])
        total = generated + failed + skipped

        # Print counts
        print(f"\nTotal files processed: {total}")
        print(f"  [+] Generated: {generated}")
        print(f"  [=] Already existed: {skipped}")
        print(f"  [X] Failed: {failed}")

        # Print success rate
        success_rate = ((generated + skipped) / total * 100) if total > 0 else 0
        print(f"\nSuccess rate: {success_rate:.1f}%")

        # Print time stats
        print(f"\nTotal time: {timedelta(seconds=int(total_time))}")
        if generated > 0:
            avg_time = total_time / generated
            print(f"Average time per file: {avg_time:.2f}s")

        # Print failed files if any
        if failed > 0:
            print(f"\n{'Failed Files:'}")
            print('-' * 60)
            for item in self.results['failed']:
                print(f"  - {item['file']}: {item.get('error', 'Unknown error')}")

        print(f"\n{'='*60}\n")

    def export_results(self, output_path: str) -> None:
        """Export results to a file.

        Args:
            output_path: Path to save the results
        """
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write("Voice Generation Report\n")
            f.write(f"Generated at: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
            f.write("=" * 60 + "\n\n")

            # Write summary
            f.write("Summary:\n")
            f.write(f"  Generated: {len(self.results['generated'])}\n")
            f.write(f"  Failed: {len(self.results['failed'])}\n")
            f.write(f"  Skipped: {len(self.results['skipped'])}\n\n")

            # Write detailed results
            for category, items in self.results.items():
                if items:
                    f.write(f"\n{category.capitalize()} Files:\n")
                    f.write("-" * 40 + "\n")
                    for item in items:
                        f.write(f"  - {item['file']}")
                        if item.get('error'):
                            f.write(f" (Error: {item['error']})")
                        f.write("\n")

    def log_configuration(self, config: Dict) -> None:
        """Log the configuration used for generation.

        Args:
            config: Configuration dictionary
        """
        if not self.verbose:
            return

        print("\nConfiguration:")
        print("-" * 40)
        for key, value in config.items():
            # Hide sensitive values
            if 'key' in key.lower() or 'token' in key.lower():
                value = '***' + str(value)[-4:] if len(str(value)) > 4 else '****'
            print(f"  {key}: {value}")
        print("-" * 40 + "\n")
