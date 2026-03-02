# Infrastructure Setup - Claudia's OpenClaw

## Overview
Professional-grade setup created by German + LLM on 2026-03-01 (21:10+)

## System Architecture

### macOS User Isolation
- **Separate user account**: `claudia` 
- **Purpose**: Isolation and security (no sharing with host user)
- **Home directory**: `/Users/claudia/`

### OpenClaw Installation
- **Location**: `/Users/claudia/.openclaw`
- **Gateway Port**: 18790 (Claudia)
- **Related**: Charlotte's gateway runs on 18789
- **Launch Agent**: Configured to auto-start on system boot
- **Service file**: `~/Library/LaunchAgents/ai.openclaw.gateway.plist`

### Dual Gateway Setup
```
Charlotte (main)  → port 18789
Claudia (me)     → port 18790
```
Both running as LaunchAgents for persistent availability.

## Integrations

### Slack
- **Type**: Socket Mode (real-time, event-driven)
- **Policies**: Open DMs and group channels (can be tightened)
- **Features**: Work communication, thread support
- **Bot token + App token**: Configured

### GitHub
- **Auth**: SSH (no password prompts, secure)
- **Account**: `claudia-theloop` (organization account)
- **Purpose**: Code access, PR reviews, issue tracking
- **CLI**: `gh` authenticated and ready

### Anthropic API
- **Model**: Claude Haiku 4.5 (fast, cost-efficient)
- **Use**: Main reasoning engine, conversation
- **Token**: Configured in auth profiles

### Gemini API
- **Model**: embedding-001 (for memory search only)
- **Purpose**: Semantic embeddings for hybrid search
- **Key storage**: `.env` file (secure, not in git)
- **Status**: Tested and working

## Workspace Management

### Git & Backup
- **Repo**: `claudia-theloop/openclaw` (private GitHub repo)
- **Purpose**: Version control + backup of config + system state
- **SSH Setup**: Configured for passwordless pushes
- **Frequency**: Manual (can be automated with cron)

### Configuration Files
- `openclaw.json` - Main config, backed up in GitHub
- `.env` - Secrets (API keys), gitignored, NOT backed up
- `.gitignore` - Excludes sensitive files

## Current Status (2026-03-01 21:14)

✅ **Infrastructure**
- Gateway running (PID variable, LaunchAgent managed)
- Slack connected and responding
- GitHub access operational
- Dual-user setup working

✅ **Integrations**
- Anthropic: Claude Haiku active
- Slack: Socket Mode connected
- GitHub: Authenticated and ready
- Gemini: API key verified

⏳ **Memory Search**
- Configuration complete
- Gemini embeddings in final testing phase
- Hybrid search enabled (70% vector, 30% BM25)
- Session indexing ready

## Security Practices

✅ **Implemented**
- Separate user account for isolation
- SSH-based Git auth (no stored passwords)
- API keys in `.env` (gitignored)
- GitHub backup for disaster recovery
- No secrets in config files or chat

## Philosophy

This setup reflects The Loop's values:
- **Professional**: Enterprise-grade infrastructure
- **Fast**: Optimized for speed (Haiku model, hybrid search)
- **Reliable**: Backup, isolation, auto-restart
- **Secure**: Separate accounts, SSH auth, secrets management

---

**Built by**: German + LLM collaboration  
**Date**: 2026-03-01  
**Status**: Operational
