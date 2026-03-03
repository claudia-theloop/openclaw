# Pickster Website - World Cup 2026 Launch
**Date**: 2026-03-02 07:30 GMT-5  
**Milestone**: New website for World Cup 2026 promotion  
**Owner**: <@U0AF5008011> (Frontend/Web Developer)  

---

## Overview

New website required to promote Pickster for World Cup 2026. Must support:
- ✅ World Cup focus (primary) + NFL (secondary)
- ✅ Localization (English + Spanish)
- ✅ Auto-detect language based on user location
- ✅ Live tournament data (standings, fixtures, progression)
- ✅ Pool creation workflow
- ✅ Mobile-responsive design

---

## Issues Created (10 Total)

### 🔴 HIGH PRIORITY (4 issues)

#### PCK-44: Website - World Cup 2026 Landing Page
- **Scope**: New landing page specifically for World Cup
- **Features**:
  - Hero section with tournament info
  - Featured pools/events
  - World map showing participating countries
  - Countdown timer to tournament start
  - Responsive design (mobile-first)
- **Owner**: <@U0AF5008011>
- **Timeline**: ASAP (World Cup starts June 2026)

#### PCK-45: Website - Localization Infrastructure (i18n)
- **Scope**: Setup internationalization framework
- **Details**:
  - Support English and Spanish initially
  - Translation management system (Crowdin/Lokalise)
  - URL routing with language prefixes (/en/, /es/)
  - Easy to add more languages later
- **Owner**: <@U0AF5008011>
- **Depends on**: None (foundational)
- **Note**: Must be done EARLY so all other pages can be localized

#### PCK-46: Website - Geolocation Language Detection
- **Scope**: Automatic language selection
- **Details**:
  - Use GeoIP service to detect country
  - Default language: Spanish for LatAm/Spain, English otherwise
  - Allow user to override (store in cookies)
  - Remember preference on repeat visits
- **Owner**: <@U0AF5008011>
- **Depends on**: PCK-45 (localization infrastructure)
- **Note**: Critical for UX in Spanish-speaking regions

#### PCK-47: Website - World Cup Content Pages
- **Scope**: Create tournament-specific pages
- **Pages**:
  - Tournament overview (rules, format, participating teams)
  - Group standings (live, updated as matches finish)
  - Fixtures/Schedule (by group, then knockout rounds)
  - Qualified teams (with flags, group assignments)
  - Pool creation for World Cup
- **Localization**: English + Spanish
- **Owner**: <@U0AF5008011>
- **Depends on**: PCK-45 (localization), PCK-50 (API integration for standings)
- **Data Source**: Pickster API (PCK-35+)

---

### 🟡 MEDIUM PRIORITY (6 issues)

#### PCK-48: Website - NFL Content Integration
- **Scope**: Keep existing NFL content alongside World Cup
- **Details**:
  - Integrate existing NFL landing page
  - Update site navigation (World Cup primary, NFL secondary)
  - Link to NFL pools
  - Ensure both sports accessible
- **Owner**: <@U0AF5008011>
- **Note**: Don't break existing NFL functionality

#### PCK-49: Website - Pool Creation Flow (World Cup)
- **Scope**: UI for creating World Cup pools
- **Flow**:
  1. Select sport (Football/Soccer)
  2. Select competition (World Cup)
  3. View fixtures
  4. Create pool (name, settings)
  5. Deep link to mobile app to join
- **Owner**: <@U0AF5008011>
- **Depends on**: API endpoints (PCK-35+)
- **Note**: May redirect to mobile app for actual gameplay

#### PCK-50: Website - Standings & Rankings Display
- **Scope**: Live tournament standings
- **Features**:
  - Group stage standings (W/D/L/GF/GA/GD/Pts)
  - Knockout progression (bracket visualization)
  - Auto-update as matches finish
- **Data Source**: `/seasons/:id/groups`, `/seasons/:id/bracket` (from API)
- **Owner**: <@U0AF5008011>
- **Depends on**: API endpoints working (PCK-35+)
- **Update Frequency**: Real-time (WebSocket) or poll every 5 mins

#### PCK-51: Website - SEO & Open Graph Optimization
- **Scope**: Search engine optimization
- **Details**:
  - Meta descriptions (tournament info, pool links)
  - Keywords (World Cup pools, fantasy football, etc.)
  - Localized sitemaps (EN, ES)
  - Open Graph tags (for social sharing)
  - Submit to Google Search Console, Bing, Yandex
- **Owner**: <@U0AF5008011>
- **Timeline**: Before launch
- **Impact**: Critical for organic traffic

#### PCK-52: Website - Analytics & Tracking Setup
- **Scope**: Track user behavior
- **Tracking**:
  - Language selection (how many users choose Spanish)
  - Pool creation (conversion funnels)
  - Traffic sources (direct, organic, referral, ads)
  - Geographic distribution
  - Engagement metrics
- **Tools**: Google Analytics 4, Mixpanel
- **Owner**: <@U0AF5008011>
- **Note**: Use data to optimize World Cup campaign

#### PCK-53: Website - Performance & Mobile Optimization
- **Scope**: Speed and mobile UX
- **Details**:
  - Lazy loading for images
  - CDN distribution
  - Caching strategy
  - Target: <2s load time on 3G
  - Test on: mobile, tablet, desktop
  - Touch-friendly UI, responsive grid
- **Owner**: <@U0AF5008011>
- **Timeline**: Final optimization pass before launch
- **Tools**: Lighthouse, WebPageTest, mobile device testing

---

## Dependency Graph

```
PCK-45 (i18n) 
├── PCK-46 (Geolocation detection)
├── PCK-47 (Content pages)
├── PCK-48 (NFL integration)
└── PCK-49 (Pool creation)

PCK-50 (Standings display)
└── Depends: API (PCK-35+)

PCK-44 (Landing page)
├── Depends: PCK-45 (i18n)
└── Depends: PCK-50 (standings data)

PCK-51 (SEO) - Can run in parallel
PCK-52 (Analytics) - Can run in parallel
PCK-53 (Performance) - Final pass before launch
```

---

## Recommended Implementation Order

### Phase 1 (Weeks 1-2): Foundation
1. **PCK-45**: Localization infrastructure (CRITICAL PATH)
2. **PCK-46**: Geolocation detection
3. **PCK-48**: NFL integration (ensure nothing breaks)

### Phase 2 (Weeks 2-4): Content
4. **PCK-44**: Landing page
5. **PCK-47**: World Cup content pages
6. **PCK-49**: Pool creation flow
7. **PCK-50**: Standings/bracket display

### Phase 3 (Weeks 4-5): Polish
8. **PCK-51**: SEO optimization
9. **PCK-52**: Analytics setup
10. **PCK-53**: Performance optimization

### Phase 4 (Before Launch)
- Testing (cross-browser, mobile, locales)
- Staging deployment
- Final review

---

## Key Requirements Summary

| Requirement | Status | Issue |
|-------------|--------|-------|
| World Cup landing page | 🔴 Not Started | PCK-44 |
| Localization (EN/ES) | 🔴 Not Started | PCK-45 |
| Auto language detection | 🔴 Not Started | PCK-46 |
| Live standings/fixtures | 🔴 Not Started | PCK-47, PCK-50 |
| Pool creation UI | 🔴 Not Started | PCK-49 |
| NFL integration (keep working) | 🔴 Not Started | PCK-48 |
| Mobile responsive | 🔴 Not Started | PCK-53 |
| SEO | 🔴 Not Started | PCK-51 |
| Analytics | 🔴 Not Started | PCK-52 |

---

## Pickster Linear Status (Updated)

**Total Issues**: Now 49 (was 39)

| State | Count | % |
|-------|-------|---|
| Done | 20 | 40.8% |
| In Progress | 1 | 2.0% |
| Todo | 18 | 36.7% |
| Backlog | 10 | 20.4% |

**New Categories**:
- 🌍 **World Cup API** (PCK-35 to PCK-43): 9 issues
- 🌐 **Website** (PCK-44 to PCK-53): 10 issues

---

## ⚠️ PENDING ASSIGNMENTS

| Issue | Owner | Status |
|-------|-------|--------|
| PCK-44 to PCK-53 | <@U0AF5008011> | ⏳ Awaiting email/confirmation |
| PCK-38 | Mobile Team Lead | ⏳ Needs identification |

---

## Timeline Considerations

⏰ **World Cup 2026 starts**: June 12, 2026  
⏰ **Recommended website launch**: March-April 2026  
⏰ **Marketing ramp-up**: May 2026  

**This gives ~1 month for development + testing before marketing starts.**

---

**Status**: ✅ 10 website issues created, awaiting assignments  
**Next**: Assign to <@U0AF5008011>, confirm timeline, start Phase 1
