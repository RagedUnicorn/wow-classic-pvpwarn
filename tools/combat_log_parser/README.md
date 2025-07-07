# Combat Log Parser for PVPWarn

This tool parses World of Warcraft combat logs to find real-world examples of spells from the PVPWarn SpellMap. It helps validate that the spell configurations are correct by matching them against actual combat events.

## Features

- Parses WoW combat log files to extract spell events
- Matches spell IDs and event types against the SpellMap
- Tracks which spells have been found (hits) and which are missing (misses)
- Generates hit/miss files for each category
- Creates a summary report with statistics
- Supports incremental parsing (skips already found spells)

## Installation

1. Navigate to the tools directory and activate the virtual environment:
```bash
cd tools
# On Linux/Mac:
source venv/.venv/bin/activate
# On Windows:
venv\.venv\Scripts\activate
```

2. Install dependencies:
```bash
cd combat_log_parser
pip install -r requirements.txt
```

## Usage

### Local Usage

Basic usage (from the combat_log_parser directory with venv activated):
```bash
python parse_combat_logs.py
```

With custom paths:
```bash
python parse_combat_logs.py --spellmap /path/to/PVPW_SpellMap.lua --logs-dir /path/to/combat/logs --output-dir /path/to/output
```

### GitHub Actions Usage (AWS S3 with OIDC)

The parser runs via GitHub Actions using OIDC authentication to access AWS S3:

#### Running the Workflow

1. **Go to Actions tab** → Combat Log Parser → Run workflow

2. **Configure inputs:**
   - **S3 path**: Subdirectory within `wow_pvpwarn/combat_logs/` (optional)
   - **Log pattern**: File pattern to match (e.g., `*.txt` or `WoWCombatLog*.txt`)
   - **Use latest**: Check to download only the most recent log
   - **Max logs**: Maximum number of logs to process (default: 10)

3. **View results** in the workflow summary:
   - OIDC authentication status
   - List of available logs in S3
   - Parser statistics showing found/missing spells
   - Upload confirmation with S3 path
   - Direct link to view results in AWS Console

#### Output Structure

Results are uploaded to S3 with timestamp versioning:
```
wow_pvpwarn/combat_log_coverage/
├── 20250106_143052/
│   ├── warrior.hit.md
│   ├── warrior.miss.md
│   ├── priest.hit.md
│   ├── priest.miss.md
│   ├── summary.md
│   └── metadata.json
```

## How to Get Combat Logs

1. Enable combat logging in WoW: `/combatlog`
2. Participate in combat (PvP or PvE)
3. Disable logging when done: `/combatlog`
4. Find the log file in your WoW `Logs` directory
5. Upload to S3 using the upload script

## How it Works

1. **Reads SpellMap.lua** - Extracts all spell definitions and their tracked events
2. **Loads existing hits** - Reads previously found spells from .hit.md files
3. **Parses combat logs** - Processes all .txt files in the logs directory
4. **Matches spells** - Looks for spell ID + event type combinations
5. **Generates output** - Creates hit/miss files and summary report

## Output Files

For each category (e.g., warrior, priest), the tool generates:

- **`category.hit.md`** - Spells found in combat logs with examples
- **`category.miss.md`** - Spells not found in any logs
- **`summary.md`** - Overall statistics and breakdown by category

## Combat Log Format

The tool expects standard WoW combat log format:
```
M/D/YYYY HH:MM:SS.SSSS  EVENT_TYPE,sourceGUID,sourceName,...,spellId,spellName,...
```

Tracked events:
- SPELL_CAST_START
- SPELL_CAST_SUCCESS
- SPELL_AURA_APPLIED
- SPELL_AURA_REMOVED
- SPELL_AURA_REFRESH

## Example Output

### warrior.hit.md
```markdown
# Warrior - Found Spell Examples

## Shield Slam (23922)
- Event: SPELL_CAST_SUCCESS
- Found in: WoWCombatLog-042125_180624.txt
- Example: `4/21/2025 18:08:30.0442  SPELL_CAST_SUCCESS,Player-5827-0270F51D,"Zmug",0x511,0x0,Creature-0-5827-1234,"Target",0x10548,0x0,23922,"Shield Slam",0x1,...`
```

### warrior.miss.md
```markdown
# Warrior - Missing Spell Examples

## Shield Wall (871)
- Events needed: SPELL_AURA_APPLIED, SPELL_AURA_REMOVED
- Status: Not found in any combat logs
```

### summary.md
```markdown
# Combat Log Parser Summary

## Overall Statistics
- Total spells in SpellMap: 523
- Spells with all events found: 312 (59.7%)
- Spells partially found: 45 (8.6%)
- Spells not found: 166 (31.7%)

## Category Breakdown

### Warrior (43 spells)
- Complete: 25 (58.1%)
- Partial: 5 (11.6%)
- Missing: 13 (30.2%)
```

## Notes

- A spell is considered "complete" only when ALL its tracked events are found
- The tool is incremental - it won't re-search for already found spell/event combinations
- Large combat logs are processed line by line for memory efficiency
- Examples are limited to one per spell/event combination to keep files manageable

## S3 Setup

### Using OIDC Authentication

This project uses OIDC (OpenID Connect) for secure, temporary AWS access:

1. **No access keys required** - Uses GitHub's OIDC provider
2. **Automatic authentication** - GitHub Actions assumes the IAM role
3. **Secure** - Temporary credentials for each workflow run

### Bucket Structure

The workflow uses the `ragedunicorn-development` bucket with this structure:

```
ragedunicorn-development/
├── wow_pvpwarn/
│   ├── combat_logs/          # Input logs
│   │   └── WoWCombatLog-011525_201530.txt
│   ├── combat_log_coverage/  # Output results
│   │   ├── 20250106_143052/
│   │   │   ├── warrior.hit.md
│   │   │   ├── summary.md
│   │   │   └── metadata.json
```

### Required Terraform Configuration

Add the PVPWarn repository to your IAM role trust policy:

```hcl
data "aws_iam_policy_document" "github_action_assume_role_policy_document" {
  statement {
    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values = [
        "repo:RagedUnicorn/wow-classic-pvpwarn:*"  # Add this line
      ]
    }
    # ... rest of the configuration
  }
}
```
