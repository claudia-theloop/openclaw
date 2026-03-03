# World Cup 2026 Implementation - Issues Summary
**Date**: 2026-03-02 07:25 GMT-5  
**Created By**: Claudia (Audit + Code Review)  
**Status**: ✅ 9 new issues created in Linear PCK workspace  

---

## Overview

Based on code review of `/feature/RL-worldcup` branch and German's clarifications, **9 new issues** have been created in Linear to complete World Cup 2026 support.

**Current State**: 70-80% of World Cup features implemented
- ✅ Database schema complete (sports, competition types, periods, groups, standings)
- ✅ API endpoints mostly working (reference, tournament, odds, billing, monetization)
- ✅ Soccer scoring logic partially complete
- ❌ Testing suite missing
- ❌ Data validation job missing
- ⚠️ Bracket auto-advancement unclear
- ⚠️ Mobile app integration incomplete for new endpoints

---

## Issues Created (9 Total)

### 🔴 HIGH PRIORITY (4 issues - Blockers for Release)

#### PCK-35: World Cup API Testing Suite
- **Scope**: Comprehensive test coverage for all new World Cup features
- **Details**:
  - Test scoring logic (exact score, winner+GD, draw, winner-only)
  - Test standings calculation from finished matches
  - Test bracket generation and knockout structure
  - Test pick creation/validation for soccer
  - Test monetization enforcement with soccer pools
  - Include edge cases, runnable in CI/CD
- **Owner**: Germán (or QA team lead)
- **Blockers**: None
- **Depends on**: Existing World Cup API (PCK-35+ depends on earlier features being stable)

#### PCK-36: Data Validation Job for Match Ingestion
- **Scope**: Implement validation for external match data (StatsPal)
- **Details**:
  - Verify match data completeness (teams, dates, initial status)
  - Detect duplicate ingestion
  - Check for data inconsistencies (wrong team IDs, invalid scores)
  - Alert on validation failures
  - Make runnable on-demand and as part of scheduler
- **Owner**: Germán
- **CRITICAL**: World Cup data must be validated before matches visible to pools
- **Blockers**: Need confirmation on StatsPal data schema

#### PCK-37: Bracket Auto-Advancement for Knockout Stages
- **Scope**: Automatic progression through tournament brackets
- **Details**:
  - Auto-advance winners from Group Stage → Round of 16
  - Auto-create next-round matchups based on tournament rules
  - Support tie-breaking (goal difference, head-to-head)
  - Handle penalty shootouts if applicable
  - **Pool owners should NOT need to manually configure**
- **Owner**: Germán
- **Blockers**: Need tournament rules finalized (tiebreaker logic)
- **Note**: This is a MUST for user experience

#### PCK-38: Mobile App - World Cup Endpoints Integration
- **Scope**: Verify + complete mobile app consumption of new endpoints
- **Details**:
  - Verify mobile team knows about:
    - `/reference/sports`, `/competition-types`, `/period-types`
    - `/seasons` with sport filtering
    - `/seasons/:id/stages`, `/groups`, `/bracket`
    - `/odds/match/:match_id/live`
  - Update pool creation flow: Sport → Competition → Season → Pool
  - Implement soccer pool UI:
    - Exact score prediction interface
    - Standings display with W/D/L/GF/GA/GD/Pts
    - Group stage + knockout views
- **Owner**: Mobile Team Lead (assign from app)
- **Blockers**: Need mobile team contact info
- **Note**: German said "la mayoría" but some gaps exist

---

### 🟡 MEDIUM PRIORITY (4 issues - Should have before launch)

#### PCK-39: World Cup Data Testing with Real Fixtures
- **Scope**: Test system with actual World Cup 2026 data
- **Details**:
  - Ingest real World Cup 2026 group stage + knockout brackets
  - Validate standings calculations vs. official tournament rules
  - Test edge cases: ties, goal difference, head-to-head
  - Verify bracket progression after simulated matches
  - Create test pools and validate scoring
- **Owner**: Germán
- **Blockers**: Need StatsPal test data or real fixture list
- **Timeline**: Should be done 2-3 months before tournament

#### PCK-40: Soccer Scoring Logic - Documentation & Edge Cases
- **Scope**: Document confirmed behavior + test edge cases
- **Details**:
  - **Confirmed**: Only full-time score matters (90 mins including ET, excluding penalties)
  - **Confirmed**: No own-goal adjustments
  - **Confirmed**: No red card/dismissal logic
  - **Confirmed**: No penalty shootout special scoring
  - **Test**: Draws (1-1, 2-2), goal difference calculations
  - **Test**: Tiebreaker removal (soccer has NO tiebreaker, unlike NFL)
  - **Test**: Goal difference as tie-breaking in standings
  - **Update**: Code with clear comments explaining these choices
- **Owner**: Germán
- **Blockers**: None
- **Note**: Critical for future maintainability

#### PCK-41: Postman Collection - World Cup Endpoints
- **Scope**: Create Postman collection for all new endpoints
- **Details**:
  - Include all `/reference/*` endpoints
  - Include `/seasons`, `/tournament/*` endpoints
  - Include `/odds/match/:match_id/live`
  - Include pool creation with soccer fields
  - Include pick creation (home/away scores)
  - Include monetization endpoints
  - Add setup instructions + examples
  - Make it shareable for mobile team + QA
- **Owner**: Germán (or tech writer)
- **Blockers**: None
- **Value**: Huge for testing, onboarding, documentation

#### PCK-42: Rollback & Correction Flow for Match Data
- **Scope**: Handle corrections to incorrect match data
- **Details**:
  - Admin ability to mark match data as "incorrect"
  - Rollback all scores/standings for affected period
  - Recalculate picks and standings after correction
  - Audit log of all corrections + who made them + when
  - **Edge case**: What if scores are 'locked' (matches finished) but later found wrong?
    - Should admin be able to override locked scores?
    - Should there be a 24-48 hour grace period?
- **Owner**: Germán
- **Blockers**: Need to decide on the "locked match correction" policy
- **Criticality**: Moderate (prevents data integrity issues, but rare)

---

### 🟢 LOW PRIORITY (1 issue - Future roadmap)

#### PCK-43: Odds Markets Roadmap
- **Scope**: Plan expansion of odds market support beyond 1x2
- **Details**:
  - Document current support: `1x2` (1x2x0) only
  - Plan for future: Asian Handicaps, Over/Under, Correct Score
  - Evaluate odds provider capabilities (StatsPal? Others?)
  - Estimated timeline for each market type
  - Identify dependencies on odds provider
- **Owner**: Germán (or Product)
- **Blockers**: None (informational)
- **Note**: Low priority because 1x2 is sufficient for MVP; can add later

---

## Key Decisions Captured in Issues

| Decision | Impact | Issue |
|----------|--------|-------|
| Only full-time score (90 mins) | Simplifies scoring logic | PCK-40 |
| No own-goal adjustments | Reduces complexity | PCK-40 |
| Auto-advance in knockout | Better UX, less admin work | PCK-37 |
| Validation job required | Data integrity | PCK-36 |
| Need test suite | Quality assurance | PCK-35 |
| Mobile integration incomplete | Blocks user-facing features | PCK-38 |

---

## Next Steps

1. **This Week**:
   - ✅ Review + prioritize all 9 issues in Linear
   - ✅ Assign teams/owners
   - ✅ Estimate effort/timeline
   - Assign PCK-38 to mobile team lead
   - Start PCK-40 (documentation - can be done in parallel)

2. **Next Sprint** (if mobile app ready):
   - PCK-35: Test suite implementation
   - PCK-36: Validation job
   - PCK-37: Bracket auto-advancement
   - PCK-40: Scoring documentation

3. **Before World Cup 2026** (Timeline TBD):
   - PCK-39: Real fixture testing
   - PCK-42: Rollback/correction logic (if needed)
   - PCK-41: Postman collection (documentation)
   - PCK-43: Odds expansion (if time/resources)

---

## Pickster Project Status Update

**Current Linear State**:
- Total issues: 39 (was 30, +9 new)
- Done: 20 (51.3%)
- In Progress: 1 (PCK-25: Payouts)
- Todo: 8 (was 6, +2 from new)
- Backlog: 10 (was 3, +7 from new)

**Work Distribution**:
- Germán: 36/39 issues (92.3%) - Still high concentration
- Paulo: 1/39 issues
- Mobile Team: 1/39 issues (PCK-38)
- Unassigned: 1/39 issues

**Recommendation**: Consider delegating some Medium-priority World Cup issues to spread workload.

---

## Files Referenced

- `/Users/claudia/.openclaw/workspace/LINEAR_AUDIT_PICKSTER.md` - Full Pickster audit
- `/Users/claudia/.openclaw/workspace/PICKSTER_WORLDCUP_AUDIT.md` - World Cup code review
- `/tmp/pickster-api/docs/worldcup/` - Official design documentation (all complete)
- `/tmp/pickster-api/feature/RL-worldcup` - Code branch reviewed

---

**Status**: ✅ Ready for team review and assignment  
**Next**: Await German's feedback on issues and timeline
