# Pickster - World Cup 2026 Implementation Audit
**Date**: 2026-03-02 06:47 GMT-5  
**Status**: Code review of feature/RL-worldcup branch  
**Scope**: Compare implementation vs. `/docs/worldcup/` planning documents  

---

## Executive Summary

✅ **Backend API**: 70-80% Complete  
- Core infrastructure for multi-sport/World Cup is **mostly in place**
- Database schema supports sports, competition types, periods, seasons, and World Cup groups/standings
- Reference endpoints, tournament data endpoints, and monetization system implemented
- Soccer scoring logic partially complete; pick validation and edge cases need review

⚠️ **Gaps & Concerns**:
1. **Pick creation/validation for soccer** - incomplete documentation; scoring logic partially tested
2. **Live odds** - integrated but only supports `1x2` market; needs testing  
3. **Job scheduler** - existing weekly scores job not clearly adapted for soccer periods
4. **Mobile API handoff** - unclear if mobile app is aware of all new endpoints
5. **Testing coverage** - no comprehensive test suite visible for new features
6. **Monetization limits** - "Plus tier" free pool limits implemented but may need testing

---

## Detailed Analysis

### ✅ Implemented Features (Database Schema)

| Feature | Status | Details |
|---------|--------|---------|
| `sport` table | ✅ Complete | `id, name` (football, soccer) |
| `competition_type` table | ✅ Complete | `id, name, sport_id` (NFL, World Cup, etc.) |
| `period_type` table | ✅ Complete | `id, name` (Week, Match Day) |
| `season` additions | ✅ Complete | `competition_type_id, period_type_id, neutral_venue` |
| `team` additions | ✅ Complete | `sport_id` (all teams in single table) |
| `pool` soccer scoring | ✅ Complete | `points_exact_score, points_winner_and_goal_difference, points_draw_not_exact, points_winner_only` |
| `pick` soccer fields | ✅ Complete | `picked_home_score, picked_away_score` for exact-score predictions |
| `pick_history` extensions | ✅ Complete | `old/new_picked_home_score, old/new_picked_away_score` |
| Season groups & standings | ✅ Complete | `season_group`, `season_stage` tables with standings SQL |
| Season fixtures (matches) | ✅ Complete | Supports group/round structure via `season_group_id` |

### ✅ Implemented Features (API Endpoints)

| Endpoint | Method | Status | Notes |
|----------|--------|--------|-------|
| `/reference/sports` | GET | ✅ Complete | Lists all sports |
| `/reference/competition-types` | GET | ✅ Complete | Supports `?sport_id=` filter |
| `/reference/period-types` | GET | ✅ Complete | Lists period types |
| `/reference/seasons` | GET | ✅ Complete | Includes `competition_type, period_type, neutral_venue` |
| `/seasons/:id/stages` | GET | ✅ Complete | Returns season stages (Group Stage, Knockouts, etc.) |
| `/seasons/:id/groups` | GET | ✅ Complete | Returns groups with standings (W/D/L/GF/GA/GD/Pts) |
| `/seasons/:id/bracket` | GET | ✅ Complete | Knockout bracket grouped by stage |
| `/odds/match/:match_id/live` | GET | ✅ Complete | Live odds snapshot (1x2 market only) |
| `/pool/:pool_id/entitlement` | GET | ✅ Complete | Effective tier (free/plus) |
| `/pool/:pool_id/limits` | GET | ✅ Complete | Returns tier, limits, feature flags |
| `/pool/:pool_id/entitlement/assign` | POST | ✅ Complete | Assign tier (owner only) |
| `/billing/purchase-context` | POST | ✅ Complete | Create purchase-to-pool mapping |
| `/billing/webhooks/revenuecat` | POST | ✅ Complete | RevenueCat webhook endpoint |
| `/billing/me` | GET | ✅ Complete | Debug endpoint (auth user context) |

### ⚠️ Partially Implemented / Needs Verification

| Feature | Status | Details |
|---------|--------|---------|
| **Pool create/update** (soccer) | ⚠️ Partial | `POST /pool/create` accepts soccer fields but **scoring validation unclear** |
| **Pick make** (soccer) | ⚠️ Partial | `POST /pool/picks/make` accepts `picked_home_score`, `picked_away_score` but **needs full testing** |
| **Soccer scoring logic** | ⚠️ Partial | Scoring strategy exists but **edge cases** (draws, goal difference) **not documented** |
| **Weekly scores job** | ⚠️ Partial | Existing `runWeeklyScores` extended for soccer but **unclear if fully tested** |
| **Team records job** | ⚠️ Partial | May not apply to soccer; status unclear |
| **Monetization enforcement** | ⚠️ Partial | Free pool limits (10 pools, 10 members) implemented but **not fully tested with soccer** |
| **Match data ingestion** | ⚠️ Partial | Uses external Cloud Function; **no API ingestion logic** but also **no validation** that external data is correct |
| **Odds market support** | ⚠️ Partial | Only `1x2` (1x2x0) market; **no spreads, handicaps, or other markets** |

### ❌ Missing / Not Implemented

| Feature | Status | Impact | Notes |
|---------|--------|--------|-------|
| **Full test suite for World Cup** | ❌ Missing | High | No visible comprehensive tests for new features |
| **Postman collection** | ❌ Missing | Medium | Documentation mentions `postman/Pickster-API-WorldCup.postman_collection.json` but not found in repo |
| **Mobile app integration** | ❌ Unknown | High | Unclear if mobile app is consuming new endpoints |
| **Pick edit validation** | ❌ Partial | Medium | Owner override on finished matches **not clearly documented** |
| **Bracket simulation** | ❌ Missing | Low | Knockout bracket UI may not be ready on mobile |
| **Live odds markets** | ❌ Limited | Medium | Only 1x2; **no Asian handicaps, O/U, etc.** |
| **Tiebreaker removal for soccer** | ⚠️ Unclear | Medium | Logic exists to **skip tiebreaker** but **not confirmed in all flows** |
| **Group stage standings** | ❌ Partial | Low | Standings logic exists but **UI display readiness unclear** |
| **Multi-sport filtering** | ❌ Partial | Low | Seasons endpoint has sport filter but **pool creation flow** may not use it |

---

## Code Review Findings

### 1. Database Schema ✅
**Status**: Well-designed and complete
- Tables (`sport`, `competition_type`, `period_type`) are normalized
- Foreign keys properly set
- Backward compatibility preserved (defaults for existing NFL data)
- **Concern**: No visible schema migration SQL scripts; need to verify deployment readiness

### 2. Reference Data Endpoints ✅
**Location**: `/routes/reference.routes.js`, `/controllers/reference.controller.js`
- `getSports()`, `getCompetitionTypes()`, `getPeriodTypes()`, `getSeasons()` all implemented
- Supports filtering by sport_id
- **Quality**: Good

### 3. Tournament/World Cup Endpoints ✅
**Location**: `/routes/tournament.routes.js`, `/controllers/tournament.controller.js`
- `getSeasonStages()` - returns stage info (Group Stage, Knockouts, etc.)
- `getSeasonGroupsWithStandings()` - calculates standings from finished matches with **complex SQL**
- `getSeasonBracket()` - knockout bracket structure
- **Quality**: Well-structured; SQL is readable
- **Concern**: No visible test data; standing calculation **not unit tested**

### 4. Scoring Logic ⚠️
**Location**: `/controllers/pool.controller.js`
- `getScoringStrategy(competitionTypeName)` determines FIFA vs NFL logic
- **Status**: Partial implementation visible but **exact logic not fully reviewed**
- **Concern**: Edge cases (draws, own-goals, penalty shootouts?) not documented

### 5. Monetization / Billing ✅
**Location**: `/routes/billing*.routes.js`, `/controllers/`
- Free vs Plus tier enforced
- Free limits: 10 active pools per owner, 10 members per free pool
- RevenueCat integration for purchase tracking
- **Status**: Implemented
- **Concern**: Interaction with soccer pools **not explicitly tested**

### 6. Odds Integration ⚠️
**Location**: `/routes/odds.routes.js`, `/controllers/odds.controller.js`
- `/odds/match/:match_id/live` returns latest normalized snapshot
- **Market support**: Only `1x2` (1x2x0) currently
- **Data source**: External (StatsPal or similar)
- **Status**: Partial
- **Concern**: No support for handicaps, O/U, or other soccer markets

### 7. Mobile API Handoff ❌
**Document**: `/docs/worldcup/04-mobile-api-handoff.md` exists but **unclear if mobile app is aware**
- Shows all expected request/response shapes
- But **no visible code comments** linking API implementation to this contract
- **Concern**: Mobile team may have outdated understanding of API

### 8. Testing & Documentation ❌
**Status**: Missing / incomplete
- No visible `/tests` or `/spec` folder
- Documentation is **excellent** (design docs very thorough)
- But **code comments** are sparse
- **Concern**: Difficult to maintain without unit/integration tests

---

## Questions for German 🤔

Before creating Linear issues, I need clarification on:

1. **Mobile App Status**: Is the mobile app team already consuming these new endpoints? Or is the API ready but mobile is behind?

2. **Scoring Logic**: In soccer, when calculating "winner + goal difference", are you supporting **own goals** and **red card dismissals**? Should scoring handle penalty shootouts (extra time)?

3. **Odds Markets**: Beyond `1x2` (1x2x0), do you plan to support:
   - Asian Handicaps (e.g., -0.5 goals)?
   - Over/Under (O/U totals)?
   - Correct Score (CS)?
   - Other markets?

4. **External Data Ingestion**: You mention Cloud Functions will populate match data. Is there:
   - A validation job to ensure the data is correct?
   - Rollback/correction logic if StatsPal data is wrong?
   - Testing with real World Cup 2026 fixture data?

5. **Bracket Generation**: For knockout stages, how should the bracket be **auto-populated**? Should the API:
   - Auto-advance winners and construct next-round matchups?
   - Or just return a "template" bracket for pool owners to configure?

6. **Multi-Sport in Pool Creation**: When a user creates a pool, the flow should be:
   - Select Sport (Football / Soccer) →  
   - Select Competition (NFL / World Cup / etc.) →  
   - Select Season →  
   - Create Pool
   
   **Is this implemented in the mobile app UI?**

---

## Linear Issues to Create

Based on this audit, here are the issues I recommend adding to Linear (PCK workspace):

### Priority: 🔴 **HIGH** (blockers for release)

1. **World Cup API Testing Suite** (New)
   - Write comprehensive tests for all new endpoints
   - Coverage: scoring logic, standings, bracket, picks
   - Type: QA / Testing

2. **Soccer Scoring Logic - Edge Cases** (New)
   - Document & test: draws, goal difference, tiebreaker removal
   - Verify: own goals, dismissals, penalty shootouts handling
   - Type: Engineering

3. **Mobile App - World Cup Endpoint Awareness** (New)
   - Verify mobile team knows about `/reference/*` and `/tournament/*` endpoints
   - Update mobile app to consume all required endpoints
   - Type: Integration

4. **Pick Validation - Soccer Edge Cases** (New)
   - Test: owner override on finished matches
   - Test: score boundaries (no negative scores, etc.)
   - Test: draw predictions (picked_home_score = picked_away_score)
   - Type: Engineering

### Priority: 🟡 **MEDIUM** (should before launch, but not blockers)

5. **Postman Collection - World Cup Endpoints** (New)
   - Create/update Postman collection with all soccer + monetization endpoints
   - Type: Documentation

6. **Schema Migration Scripts** (New)
   - Provide SQL migration for production deployment
   - Include data backfill for existing NFL seasons
   - Type: DevOps

7. **Live Odds Markets Expansion** (New)
   - Add support for Asian Handicaps, O/U, Correct Score
   - Type: Engineering (may depend on odds provider)

8. **Bracket Auto-Population Logic** (New)
   - Decide: auto-advance winners or manual configuration
   - Implement bracket generation for knockout stages
   - Type: Product + Engineering

9. **Data Ingestion Validation** (New)
   - Implement validation job for external match data
   - Add rollback/correction flow if data is incorrect
   - Type: Engineering

### Priority: 🟢 **LOW** (nice-to-have / future)

10. **Group Stage UI Polish** (New)
    - Ensure standings display is clean on mobile
    - Type: UI/UX

11. **Multi-Sport Pool Creation Flow** (Enhancement)
    - Ensure pool creation guides users through sport → competition → season → pool
    - Type: Product

---

## Recommendations

### Immediate (This Week)
1. **Clarify with German**: Answer the 6 questions above
2. **Create Linear issues** based on his answers
3. **Code review**: Have team review scoring logic + monetization interaction
4. **Mobile coordination**: Sync with mobile team on endpoint readiness

### Short-term (Next Sprint)
1. Write comprehensive test suite
2. Address High-priority issues
3. Update Postman collection
4. Deploy to staging and test with mock World Cup data

### Longer-term (Before World Cup 2026)
1. Stabilize API based on real tournament data
2. Handle edge cases discovered in testing
3. Expand odds market support
4. Polish UI/UX for tournament viewing

---

## Files Reviewed

✅ `/tmp/pickster-api/docs/worldcup/` (complete)
✅ `/tmp/pickster-api/controllers/` (reference, tournament, pool, odds, billing)
✅ `/tmp/pickster-api/routes/` (all route files)
✅ `/tmp/pickster-api/app.js` (routing setup)
✅ Commit history on `feature/RL-worldcup` branch

---

**Next Step**: Awaiting clarifications from German before creating Linear issues.
