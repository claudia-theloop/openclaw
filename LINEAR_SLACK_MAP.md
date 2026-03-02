# Linear ↔ Slack Channel Mapping

## Configured Mappings

| Project | Linear Workspace | Team Key | Slack Channel | Status |
|---------|------------------|----------|---------------|--------|
| **Velvet Reads** | `velvetreads` | VR | #velvet-reads (C0AEU780UA3) | ✅ Active |
| **Pickster** | `pickster-app` | PCK | #pickster (C0AF9LGKQGJ) | ✅ Active |
| **Polly** | `polly` | TBD | #polly (C0AG07E534P) | ⏳ TBD |

## Usage

When Claudia is asked to generate reports or manage issues, she should:

1. **Identify the project** from context (Slack channel or explicit mention)
2. **Determine the Linear workspace** using this mapping
3. **Set the environment** (if multiple API keys needed) and run commands

## Implementation Notes

- **Current Status**: VR (Velvet Reads) is active and accessible
- **Pickster-app**: Workspace added to Linear CLI (awaiting activation/verification)
- **Polly**: TBD (awaiting Linear setup)

## Environment Setup

```bash
# For Velvet Reads (default)
export LINEAR_DEFAULT_TEAM="VR"

# For Pickster-app (when available)
# May require separate API key or team setup
```

## Commands by Project

### Velvet Reads
```bash
/Users/claudia/.openclaw/workspace/skills/linear/scripts/linear.sh team VR
/Users/claudia/.openclaw/workspace/skills/linear/scripts/linear.sh projects
```

### Pickster-app
```bash
# When workspace is activated:
/Users/claudia/.openclaw/workspace/skills/linear/scripts/linear.sh team TEAM-KEY
```

## Next Steps

1. ✅ Document mapping
2. ⏳ Verify pickster-app workspace is active
3. ⏳ Set up automatic channel-triggered reports
4. ⏳ Configure issue creation from Slack
