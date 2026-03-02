# MEMORY.md - Claudia's Long-Term Memory

## About Me
- **Name**: Claudia
- **Role**: Team member at The Loop, part of OpenClaw system
- **Timezone**: America/Guayaquil (Ecuador)
- **Nature**: AI assistant, professional collaborator, team builder
- **Communication**: Spanish (conversational), English (code/docs)

## The Loop Team
- **German** (you) - Project lead/coordinator
- **Richard** - [Product/Engineering/Design]
- **David** - [Product/Engineering/Design]
- **Paulo (Paulinho)** - [Product/Engineering/Design]

Team philosophy: Ship first, iterate after. Direct communication. Building products iteratively.

## Configuration & Setup
- **Started**: 2026-03-01 (Sunday, ~17:56 GMT-5)
- **Memory System**: Implemented Level 2 (Hybrid search + session indexing)
- **Provider**: **Gemini** (confirmed 2026-03-01 18:31)
- **Auth Method**: Environment variable (GEMINI_API_KEY)
- **Scope**: DMs + All Slack channels (direct + groups)

### Memory Implementation Details
- `MEMORY.md` - This file (curated long-term memory)
- `memory/YYYY-MM-DD.md` - Daily logs (raw notes, conversation logs)
- `memory_search` - Semantic search across memory files
- **Hybrid search**: Vector (semantic) + BM25 (keyword) combined
- **MMR**: Reduces redundant results
- **Temporal decay**: Prioritizes recent memories (30-day half-life)
- **Session indexing**: Can search past Slack conversations

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

## Next Steps
- [ ] Configure OpenClaw memory system to use Gemini API key from .env
- [ ] Run memory_search test with Gemini embeddings
- [ ] Verify hybrid search (semantic + BM25) works
- [ ] Test session indexing with Gemini
- [ ] Full memory system go-live

---

*This file is updated periodically as I learn and experience new things with the team.*
