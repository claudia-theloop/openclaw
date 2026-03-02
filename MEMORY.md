# MEMORY.md - Claudia's Long-Term Memory

## About Me
- **Name**: Claudia
- **Role**: Team member at The Loop, part of OpenClaw system
- **Timezone**: America/Guayaquil (Ecuador)
- **Nature**: AI assistant, professional collaborator, team builder
- **Communication**: Spanish (conversational), English (code/docs)

## The Loop Team
- **German** - Project lead/coordinator, infrastructure builder
- **Richard** - [Product/Engineering/Design]
- **David** - [Product/Engineering/Design]
- **Paulo (Paulinho)** - [Product/Engineering/Design]

Team philosophy: Ship first, iterate after. Direct communication. Building products iteratively.

**Note**: German is deeply invested in building solid infrastructure for me, including separate system users, GitHub backups, and enterprise-grade security practices. ¡Qué equipo!

## Infrastructure & Configuration

### System Setup (German + LLM, 2026-03-01 21:10+)
- **OS User**: Separate macOS user account (`claudia`) for isolation
- **OpenClaw Installation**: `/Users/claudia/.openclaw`
- **Gateway**: Port 18790 (Charlotte's gateway on 18789)
- **Launch Agent**: Auto-start on boot (configured via LaunchAgent)
- **Backup**: Private GitHub repo (`claudia-theloop/openclaw`) with version history

### Memory System
- **Type**: Level 2 (Hybrid search + session indexing)
- **Provider**: **Gemini** (confirmed 2026-03-01 18:31)
- **Auth Method**: Environment variable (GEMINI_API_KEY in .env)
- **Status**: Final testing phase (21:14)
- **Scope**: DMs + All Slack channels (direct + groups)

### Memory Implementation Details
- `MEMORY.md` - This file (curated long-term memory)
- `memory/YYYY-MM-DD.md` - Daily logs (raw notes, conversation logs)
- `memory_search` - Semantic search across memory files (Gemini embeddings)
- **Hybrid search**: Vector (semantic, 70%) + BM25 (keyword, 30%) combined
- **MMR** (Max Marginal Relevance): Reduces redundant results (lambda: 0.7)
- **Temporal decay**: Prioritizes recent memories (30-day half-life)
- **Session indexing**: Can search past Slack conversations + memory files

### Integrations & Auth
- **Slack**: Socket Mode (real-time messaging, DMs + group channels)
- **GitHub**: CLI authenticated as `claudia-theloop` (org account)
- **Anthropic**: Claude Haiku model (fast, efficient) configured
- **Gemini**: API key in `.env`, embeddings-001 model for memory search

## Durable Decisions
- Using OpenClaw memory tools for persistence across sessions
- Memory is local to workspace (privacy-first approach)
- Daily notes + curated long-term memory (two-layer system)
- **Gemini** chosen for embeddings (confirmed with German 2026-03-01)
- API key stored securely as environment variable (not in code/Slack)
- Documentation: See `GEMINI_SETUP.md` for detailed setup steps

## Security Notes (2026-03-01)
- ⚠️ API key was shared in Slack at 18:32 — revoked immediately
- Documented best practices: Never share secrets in chat
- Setup guide includes clear revocation + new key generation steps
- Variables of environment method chosen for simplicity

## Setup Progress (2026-03-01)
- ✅ Revoked compromised API key (18:32 incident)
- ✅ Generated new API key 
- ✅ Configured in .zshrc (verified 18:53)
- ✅ Added to .env file for OpenClaw access (18:54)
- ✅ API key tested + verified working (18:55)
- ✅ Confirmed Gemini models available (gemini-2.0-flash, etc.)

## Setup Progress (2026-03-01)
- ✅ Revoked compromised API key (18:32 incident)
- ✅ Generated new API key 
- ✅ Configured in .zshrc (verified 18:53)
- ✅ Added to .env file for OpenClaw access (18:54)
- ✅ API key tested + verified working (18:55)
- ✅ Confirmed Gemini models available (gemini-2.0-flash, etc.)
- ✅ Updated openclaw.json with Gemini config (19:00+)
- ✅ Gateway restarted successfully (21:10)
- ✅ Configuration verified and complete (21:10)

## Next Steps
- [ ] Monitor memory_search initialization (may take a moment for Gemini embeddings)
- [ ] Run full memory_search test with Gemini
- [ ] Verify hybrid search (semantic + BM25) works
- [ ] Test session indexing with Gemini
- [ ] Full memory system operational

---

*This file is updated periodically as I learn and experience new things with the team.*
