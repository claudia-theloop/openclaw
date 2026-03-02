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
  - ✅ Channels: #velvet-reads, #pickster, #polly (project channels)
- **GitHub**: CLI authenticated as `claudia-theloop` (org account)
  - ✅ Organizations: Gentlemen-s-Readers-Club, Pickster-App, Polly-Market
- **Anthropic**: Claude Haiku model (fast, efficient) configured
- **Gemini**: API key in `.env`, embeddings-001 model for memory search

### The Loop Projects Context

#### 🔖 VELVET READS
**Tagline**: AI-Powered Book Creation & Reading Platform

**GitHub Org**: Gentlemen-s-Readers-Club

**Overview**: Complete ecosystem for AI-powered book generation, editing, and distribution. Multi-service architecture with mobile, web, and backend components.

**Repositories (6 total):**

1. **velvetreads-website** (Next.js/TypeScript)
   - **Purpose**: Landing page + product waitlist
   - **Live**: https://v0-product-launch-waitlist-six-flax.vercel.app
   - **Tech**: Next.js 14, Radix UI, React Hook Form, MDX
   - **Routes**: home, /about, /blog, /contact, /help, /testimonials, /privacy-policy, /terms
   - **Features**: Waitlist form, testimonials, contact form, blog support, SEO (sitemap, robots.txt)
   - **Key Libraries**: Radix UI (comprehensive component set), React Hook Form + Zod validation
   - **Server Actions**: Form submission, data handling

2. **grc-mobile-app** (React Native/Expo)
   - **Purpose**: Mobile reading app (iOS + Android)
   - **Tech Stack**: 
     - Expo Router (file-based routing)
     - React Native
     - EPUB.js (ebook rendering)
     - Redux Toolkit (state management)
     - Supabase (backend)
     - Google Fonts: Inter, Literata, Playfair Display
   - **Core Dependencies**:
     - @epubjs-react-native: EPUB file handling
     - @react-navigation: Tab navigation
     - @gorhom/bottom-sheet: Bottom sheet UI
     - expo-camera, expo-image-picker: Media capture
   - **Scripts**: `dev` (tunnel mode), `build:web`, `lint`
   - **Features**: Book reading, library management, user preferences

3. **ebook-agent** (FastAPI/Python)
   - **Purpose**: AI-powered ebook generation backend
   - **Tech Stack**:
     - FastAPI (REST API)
     - LangGraph + LangChain (AI workflows)
     - OpenAI GPT models (content generation)
     - Supabase (database + auth)
     - ebooklib (EPUB generation)
     - Python 3.13
   - **Core Features**:
     - AI-generated book titles
     - Automatic book structure & outlines
     - Chapter content generation
     - Quality evaluation chains
     - Multi-language support
     - EPUB packaging & export
   - **Generation Process**: Title → Structure → Content → Evaluation → Revisions → EPUB
   - **Configuration**: Book sizes (small/medium/large), genres, tone, narrator style
   - **API**: `/api/v1/generate-book`, `/api/v1/generate-epub`, `/api/v1/generate-cover`
   - **Models Used**: GPT-5.2 (titles, structure), GPT-5-mini (content, evaluation)

4. **ebook-editor** (Next.js 16/TypeScript)
   - **Purpose**: Web-based ebook editor & authoring tool
   - **Tech Stack**:
     - Next.js 16 (App Router)
     - React 19
     - Supabase (backend + auth)
     - TipTap (rich text editor with extensible plugins)
     - Radix UI + Tailwind CSS
     - Zod (validation)
   - **Rich Text Features**: Text alignment, underline, placeholder, markdown support
   - **Editor Capabilities**: Full WYSIWYG ebook editing
   - **Database**: Supabase project integration (auto-generate TypeScript types)
   - **UI Components**: Custom Radix UI components with Tailwind styling
   - **Scripts**: `dev`, `build`, `start`, `lint`, `prettier`, `generate` (Supabase types)

5. **prosepilot-editor** (Vite/React 18)
   - **Purpose**: Alternative editor UI (book writing/editing)
   - **Tech Stack**:
     - Vite (fast bundler)
     - React 18
     - TipTap 2.x (rich text)
     - Radix UI (dialogs, dropdowns, labels, toasts)
     - Redux Toolkit (state management)
     - Tailwind CSS + @tailwindcss/typography
     - Mailchimp Marketing API (newsletter integration)
     - Paddle.js (payments/subscriptions)
     - Drag-and-drop with @dnd-kit
   - **Features**: 
     - Rich text editing with formatting
     - Drag-and-drop elements
     - Analytics (Google Analytics 4)
     - File upload (react-dropzone)
     - Newsletter signup
     - Payment integration
   - **Scripts**: `dev`, `build`, `lint`, `preview`

6. **prosepilot-agent** (FastAPI/Python)
   - **Purpose**: AI-powered book generation backend (alternative implementation)
   - **Tech Stack**:
     - FastAPI (REST API)
     - LangChain + LangGraph (AI workflows)
     - OpenAI (language models)
     - Supabase (database + auth)
     - File export: EPUB, DOCX, PDF
     - Mailchimp API (newsletters)
     - Heroku deployment ready
   - **Core Features**:
     - AI book generation workflows
     - Multi-format export (EPUB, DOCX, PDF)
     - User authentication & management
     - Newsletter integration
     - Mailchimp email marketing
   - **API Endpoints**: 
     - `/api/v1/books` - Generation & management
     - `/api/v1/files` - Export & processing
     - `/api/v1/newsletter` - Newsletter management
     - `/api/v1/user` - Auth & user management
   - **Deployment**: Heroku-ready (Procfile included)
   - **Config**: Pydantic settings, environment-based configuration

**Technology Summary**:
- **Frontend**: Next.js (web editors) + React Native/Expo (mobile)
- **Backend**: FastAPI (Python) with LangChain/LangGraph for AI
- **Database**: Supabase (PostgreSQL + Auth)
- **AI/ML**: OpenAI GPT models, LangChain, LangGraph workflows
- **File Generation**: EPUB, DOCX, PDF support
- **UI**: Radix UI, Tailwind CSS, TipTap editors
- **Integrations**: Mailchimp (newsletters), Paddle (payments), Google Fonts

**Full Ecosystem Architecture**:

```
┌─────────────────────────────────────────────────────────────────┐
│                   VELVET READS ECOSYSTEM                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌─ DISCOVERY LAYER                                             │
│  │  velvetreads-website (Next.js landing page)                  │
│  │  → Marketing, waitlist, testimonials, collection showcase    │
│  │  → Live: https://velvetreads.app                              │
│  │  → Promotes app download (iPhone, Android coming)            │
│  │                                                               │
│  ├─ CREATION LAYER (Dual editors for authoring)                │
│  │  ┌─ ebook-editor (Next.js 16 + TipTap)                      │
│  │  │   • Web-based rich text editor                            │
│  │  │   • Supabase auth + database integration                  │
│  │  │   • TipTap editor with text formatting                    │
│  │  │   • Components: auth, book-detail, book_editor, dashboard │
│  │  │   • Fonts: Roboto (body), Lora (headings)                │
│  │  │                                                            │
│  │  └─ prosepilot-editor (Vite + React 18)                     │
│  │      • Alternative editor interface                          │
│  │      • Drag-and-drop chapter organization (@dnd-kit)        │
│  │      • Payment integration (Paddle.js)                       │
│  │      • Newsletter signup (Mailchimp)                         │
│  │      • Subscription management + credit system               │
│  │      • Advanced styling: Tailwind + @tailwindcss/typography │
│  │                                                               │
│  ├─ GENERATION LAYER (Two LangGraph-based backends)            │
│  │  ┌─ ebook-agent (FastAPI + Python)                          │
│  │  │   API: POST /api/v1/generate-book                         │
│  │  │   API: POST /api/v1/generate-epub                         │
│  │  │   API: POST /api/v1/generate-cover                        │
│  │  │                                                            │
│  │  │   Book Generation Workflow:                               │
│  │  │   1. Title Generation (GPT-5.2) → Creative titles         │
│  │  │   2. Structure Planning (GPT-5.2) → Ch outlines + arcs    │
│  │  │   3. Content Generation (GPT-5-mini) → Write chapters     │
│  │  │   4. Quality Evaluation (GPT-5-mini) → Check coherence    │
│  │  │   5. Revision Loop → Regenerate if quality ❌            │
│  │  │   6. Summarization (GPT-5-mini) → Ch summaries            │
│  │  │   7. EPUB Export → Package for distribution               │
│  │  │                                                            │
│  │  │   Key Chains:                                              │
│  │  │   • book_title.py → Generates creative titles             │
│  │  │   • book_structure.py → Plans book structure/arcs         │
│  │  │   • generation.py → Content generation per chapter        │
│  │  │   • evaluation.py → Quality assurance loop                │
│  │  │   • summary.py → Chapter summarization                    │
│  │  │   • book_cover.py → AI-generated covers                   │
│  │  │                                                            │
│  │  │   State Management (LangGraph BookAgentState):            │
│  │  │   - messages, book_structure, current_chapter             │
│  │  │   - passes_quality_check, previous_chapter_content        │
│  │  │   - summary                                                │
│  │  │                                                            │
│  │  └─ prosepilot-agent (FastAPI + Python)                      │
│  │      API Routes (app/api/v1/):                               │
│  │      • books.py → Book generation & management               │
│  │      • exporter.py → Multi-format export (EPUB/DOCX/PDF)    │
│  │      • newsletter.py → Mailchimp email integration           │
│  │      • user.py → User auth & management                      │
│  │                                                               │
│  │      Supports: EPUB, DOCX, PDF multi-format export           │
│  │      Deployment: Heroku-ready (Procfile included)            │
│  │      Additional: Newsletter + subscription features          │
│  │                                                               │
│  ├─ CONSUMPTION LAYER                                            │
│  │  grc-mobile-app (React Native + Expo)                        │
│  │                                                               │
│  │  Core Architecture:                                           │
│  │  • Redux Toolkit → State management                          │
│  │  • Supabase → Database + auth                                │
│  │  • EPUB.js → Native ebook rendering                          │
│  │  • Expo Router → File-based routing                          │
│  │                                                               │
│  │  Navigation Structure:                                        │
│  │  ├─ /auth → Login/signup flows                              │
│  │  ├─ /disclaimer → Legal/content warnings                    │
│  │  ├─ /onboarding → First-time user setup                     │
│  │  └─ /(app)/(tabs) → Main app                                │
│  │     ├─ index.tsx → Home/featured books                       │
│  │     ├─ search.tsx → Book discovery                           │
│  │     ├─ library.tsx → User's library                          │
│  │     └─ profile.tsx → Settings/account                        │
│  │  ├─ /reader/[id] → Book reading interface                   │
│  │  ├─ /book/[id] → Book details page                          │
│  │  └─ /category/[id] → Category browsing                      │
│  │                                                               │
│  │  Key Features:                                                │
│  │  • EPUB rendering with @epubjs-react-native                  │
│  │  • Bottom sheet UI (@gorhom/bottom-sheet)                    │
│  │  • Camera + image picker (for profiles)                      │
│  │  • Push notifications (expo-notifications)                   │
│  │  • Haptic feedback (expo-haptics)                            │
│  │  • Font management: Inter, Literata, Playfair Display       │
│  │  • Internationalization (i18n support)                       │
│  │  • Redux hooks for state access                              │
│  │                                                               │
│  │  Custom Hooks:                                                │
│  │  • useBooks() → Fetch/filter books from Supabase             │
│  │  • useCategories() → Get book categories                     │
│  │  • useEditorPicks() → Featured books selection               │
│  │  • useRecentlyAdded() → Latest book releases                 │
│  │  • useTranslation() → Multi-language support                 │
│  │  • useAlert() → Alert management                             │
│  │                                                               │
│  ├─ DATA LAYER                                                   │
│  │  Supabase PostgreSQL (single shared database)                │
│  │                                                               │
│  │  Tables:                                                      │
│  │  • users (auth + profiles)                                    │
│  │  • books (book metadata + status)                             │
│  │  • chapters (chapter content)                                 │
│  │  • chapter_versions (versioning)                              │
│  │  • book_categories (genre tagging)                            │
│  │  • book_authors (authorship)                                  │
│  │  • user_library (reading history)                             │
│  │  • covers (multiple cover versions)                           │
│  │                                                               │
│  └─ AI LAYER                                                     │
│     OpenAI GPT Models:                                           │
│     • GPT-5.2 → Title generation, structure planning             │
│     • GPT-5-mini → Chapter writing, evaluation, summaries        │
│                                                                   │
│     LangGraph Workflows:                                         │
│     • Node-based state machine for book generation               │
│     • Conditional logic: quality checks, revision loops          │
│     • Parallel processing: chapter generation                    │
│     • Error handling: fallback chains, retries                   │
│                                                                   │
└─────────────────────────────────────────────────────────────────┘
```

**Data Flow - End-to-End Book Creation**:

```
1. Writer/Editor accesses ebook-editor or prosepilot-editor
                ↓
2. Authenticates with Supabase Auth
                ↓
3. Creates new book (title, categories, settings)
                ↓
4. Triggers "Generate Book" → Calls ebook-agent or prosepilot-agent
                ↓
5. LangGraph workflow starts:
   a) BookGenerator.__init__() → Load user preferences
   b) LangGraph nodes execute in sequence:
      - Title node → GPT-5.2 generates creative title
      - Structure node → GPT-5.2 plans chapters + arcs
      - Generation loop → For each chapter:
         • Call GPT-5-mini to write chapter
         • Evaluate quality with GPT-5-mini
         • If fails: regenerate chapter
         • If passes: save to Supabase + move to next
      - Summary node → Create chapter summaries
   c) save_book(), save_chapter(), save_chapter_version()
      → Write to Supabase
                ↓
6. Cover generation (optional):
   Generate 2 versions: "for men", "for women" audiences
                ↓
7. Export to EPUB/DOCX/PDF:
   Package with cover, chapters, metadata
                ↓
8. Mobile reader discovers book:
   - Supabase queries book list
   - Displays in app UI (featured, by category, search)
                ↓
9. User reads on mobile:
   - Download EPUB from URL
   - Render with EPUB.js in reader
   - Track reading progress
   - Save to user's library
```

**Tech Stack Summary**:
- **Discovery**: Next.js (marketing)
- **Creation**: Next.js 16 (ebook-editor) + Vite/React 18 (prosepilot-editor)
- **Generation**: FastAPI (Python) + LangChain/LangGraph + OpenAI
- **Consumption**: React Native/Expo (mobile)
- **Database**: Supabase (PostgreSQL + auth)
- **File Generation**: EPUB (ebooklib), DOCX (python-docx), PDF (xhtml2pdf)
- **UI**: Radix UI (web), custom components (mobile)
- **Integrations**: Mailchimp (newsletters), Paddle (payments), OpenAI (AI)

**Key Features Across Platforms**:
- ✅ AI-powered book generation (LangGraph workflows)
- ✅ Multi-model generation (GPT-5.2 for planning, GPT-5-mini for content)
- ✅ Quality evaluation chains (auto-regenerate if quality fails)
- ✅ Multi-format export (EPUB, DOCX, PDF)
- ✅ Web-based rich text editing (TipTap editors)
- ✅ Mobile reading experience (EPUB.js rendering)
- ✅ User authentication & library management
- ✅ Newsletter integration (Mailchimp)
- ✅ Payment/subscription support (Paddle)
- ✅ Multi-language book generation
- ✅ Dynamic cover generation (multiple audience versions)
- ✅ Chapter versioning & history tracking
- ✅ Real-time sync across all platforms (via Supabase)

#### 📦 PICKSTER
**Tagline**: "Pick your way to victory!" — NFL Pick 'Em Pools platform

**GitHub Org**: Pickster-App

**Architecture Overview**:
- **Frontend**: Next.js admin dashboard + Flutter mobile app
- **Backend**: Node.js/Express REST API + Firebase Cloud Functions
- **Database**: PostgreSQL
- **Auth**: Firebase Admin + StreamChat integration
- **Infrastructure**: Backup jobs + database management

**Repository Breakdown**:

1. **pickster-api** (Node.js/JavaScript - CORE)
   - **Purpose**: Backend REST API for the entire platform
   - **Framework**: Express.js
   - **Database**: PostgreSQL
   - **Controllers**: pool, match, user, feature-request
   - **Auth**: Firebase (ID token verification), StreamChat integration
   - **Features**:
     - Users & authentication
     - NFL Pick 'Em pools management
     - Memberships & standings
     - Match/picks handling
     - Feature requests
     - Background jobs
   - **Documentation**: Comprehensive docs in `/docs` folder (getting-started, overview, api-reference, architecture, configuration, features, database, workflow)
   - **Related**: Consumed by pickster-app (Flutter) and pickster-functions

2. **pickster-app** (Flutter/Dart - MOBILE)
   - **Purpose**: Mobile application for iOS & Android
   - **Tech Stack**: Flutter, Dart
   - **Platform Support**: iOS (certificates, keys included), Android (gradle setup)
   - **Structure**:
     - `/app` - Flutter project root (lib, pubspec.yaml, android, ios)
     - `/assets` - Fonts, images, videos
     - `/docs` - Comprehensive guides
   - **Relationship**: Consumer of pickster-api
   - **Setup**: `cd app && flutter pub get && flutter run`

3. **pickster-admin** (Next.js/TypeScript - DASHBOARD)
   - **Purpose**: Admin dashboard for managing Pickster
   - **Framework**: Next.js 15 (with Turbopack)
   - **Build**: TypeScript, Tailwind CSS, Radix UI
   - **Key Libraries**:
     - React Table (TanStack)
     - Recharts (data visualization)
     - Firebase & Firebase Admin
     - PostgreSQL client (pg)
     - Date/time management (date-fns)
   - **Scripts**: `dev`, `build`, `start`, `lint`
   - **UI Components**: Rich Radix UI library (dialogs, tables, dropdowns, etc.)

4. **pickster-website** (Next.js - MARKETING)
   - **Purpose**: Marketing/landing page for Pickster
   - **Status**: Minimal (single README.md)
   - **Note**: Likely content-focused or placeholder

5. **pickster-mobile-app** (PLACEHOLDER)
   - **Status**: Empty repository (archived or not yet populated)
   - **Note**: Main mobile app is in `pickster-app` (Flutter)

6. **functions** (Firebase Cloud Functions - TypeScript)
   - **Purpose**: Serverless functions for backend automation
   - **Framework**: Firebase (Google Cloud)
   - **Tech**: TypeScript, ESLint configured
   - **Configuration**: firebase.json, .firebaserc
   - **Key Tasks**: Likely includes week switching, team records computation, scheduled jobs
   - **Deployment**: Via Firebase CLI

7. **pickster-backup-job** (INFRASTRUCTURE)
   - **Purpose**: Data backup automation
   - **Status**: Supporting infrastructure

8. **db-backup** (INFRASTRUCTURE)
   - **Purpose**: Database backup management
   - **Status**: Supporting infrastructure

**Tech Stack Summary**:
- **Backend**: Node.js + Express.js + PostgreSQL
- **Admin**: Next.js 15 + React 19 + Radix UI + Tailwind
- **Mobile**: Flutter (iOS/Android)
- **Functions**: Firebase Cloud Functions (TypeScript)
- **Auth**: Firebase Admin + StreamChat
- **Deployment**: Likely Google Cloud / Firebase + Node hosting

**Key Dependencies**:
- Express.js, Passport (auth), Firebase, pg (PostgreSQL)
- React, Next.js, Radix UI, TanStack Table, Recharts
- Flutter, Dart

**Shared Across Projects**:
- `/docs` directories (architecture, API reference, configuration, features)
- Firebase integration
- PostgreSQL database schema
- Auth patterns (Firebase + StreamChat)

#### 🎯 POLLY
**Tagline**: Polymarket Layer 1A Arbitrage Bot Dashboard

**GitHub Org**: Polly-Market

**Description**: Trading terminal dashboard for a crypto market arbitrage bot. Monitors Polymarket prediction markets, identifies complement arbitrage opportunities (YES + NO < $1.00 after fees), and executes trades. Real-time P&L tracking, risk controls, and activity logging.

**Technology Stack:**
- **Frontend**: React 18 + Vite
- **Database**: Supabase (PostgreSQL)
- **Auth**: Supabase Auth with RLS (Row-Level Security)
- **Charts**: Recharts (P&L sparklines)
- **Styling**: CSS + design tokens (no Tailwind, no component libraries)
- **Fonts**: JetBrains Mono (body), Syne (headings)
- **Build**: Vite, JavaScript/JSX

**Key Repository: polly-dashboard**
- **Location**: https://polly-dashboard-grc-dacb51d2.vercel.app
- **Type**: Dashboard UI (React)

**Architecture Overview:**

**Database (Supabase PostgreSQL)**:
1. **scanner_state** (singleton) — Bot status updates every cycle
   - status: 'running' | 'paused' | 'stopped'
   - last_scan_at, current_cycle, scan_progress
   - markets_monitored, total_markets, opportunities_found
   - paper_pnl, paper_trade_count
   - Dashboard reads/writes status; bot reads and respects pause/stop

2. **risk_config** (singleton) — User-controlled trading parameters
   - bot_active, auto_execute, paper_mode
   - min_gap_cents, max_position_usd, daily_loss_limit_usd, fee_tolerance_cents
   - Bot reads these; dashboard writes updates

3. **opportunities** — Active market opportunities
   - market ID, YES/NO prices, gap (profit %), confidence score, status
   - Bot: INSERT/UPSERT
   - Dashboard: READ (displays in OpportunitiesTable)

4. **trades** — Executed trades (paper and live)
   - Bot: INSERT
   - Dashboard: READ (displays in TradeLog with historical P&L)

5. **activity_log** — Event stream for debugging
   - timestamp, type ('info' | 'arb' | 'trade' | 'warn' | 'error'), message
   - Bot: INSERT
   - Dashboard: READ (real-time feed)

6. **capital_deposits** — Paper/live capital tracking
   - Bot: READ
   - Dashboard: READ, INSERT (user adds capital)

**Frontend Components:**
- **Topbar** (52px) — Status, controls, mode badge, pause/kill buttons
- **LeftSidebar** (220px) — Overview stats (P&L, opportunities, markets), active markets list
- **CenterPanel** (responsive) — Tabs for opportunities table, trade log, P&L chart, debug
- **RightPanel** (280px) — Risk controls, sliders, toggles, capital deposits

**Core Data Models:**
```ts
Opportunity {
  id, name, yesPrice, noPrice, sum, gap, estProfitPer100, confidence, status
}

ScannerState {
  status, lastScanSecondsAgo, currentCycle, scanProgress, marketsMonitored, 
  totalMarkets, opportunitiesFound, paperPnl, paperTradeCount, activeTab
}

RiskConfig {
  botActive, autoExecute, paperMode, minGapCents, maxPositionUsd, 
  dailyLossLimitUsd, feeToleranceCents
}

Trade {
  id, timestamp, tradeType ('paper' | 'live'), marketId, gap, executionPrice, 
  positionUsd, estProfit, actualProfit, status
}

LogEntry {
  id, timestamp, type, message, highlight, highlightClass
}
```

**React Hooks (State Management):**
- `useScanner()` — Scanner state, trades, opportunities, control methods (pause/resume/kill)
- `useScannerState()` — Low-level scanner_state singleton access
- `useRiskConfig()` — Risk parameters, update methods
- `useOpportunities()` — Market opportunities list
- `useTrades()` — Executed trades with filtering
- `useActivityLog()` — Activity log feed
- `useCapitalDeposits()` — Capital tracking
- `useSparklineData()` — P&L chart data
- `useSupabaseTable()` — Generic Supabase table CRUD hook

**Database Setup (SQL Scripts):**
1. `001_create_tables.sql` — Schema definition
2. `002_rls_policies.sql` — RLS for user data isolation
3. `003_seed_data.sql` — Initial singleton rows
4. `004_seed_dev_data.sql` — Mock opportunities/trades for testing
5. `005_capital_deposits.sql` — Capital tracking table + RLS
6. `005_enable_realtime.sql` — Supabase Realtime for live updates

**Documentation** (in `/docs` folder):
- `BOT_INTEGRATION.md` — For bot developers (table specs, write permissions, examples)
- `LAYOUT_SPEC.md` — 3-column grid layout, pixel-perfect positioning
- `COMPONENTS_SPEC.md` — Detailed component breakdown
- `DATA_SPEC.md` — Data shapes, mock data, state flows
- `DESIGN_SYSTEM.md` — Colors, fonts, spacing, design tokens
- `FIELD_MAPPINGS.md` — Database column to UI field mappings
- `IMPLEMENTATION_PLAN.md` — Development roadmap
- `polymarket_dashboard.html` — Reference design mockup (static HTML)

**Key Features:**
- **Arbitrage Detection**: Finds markets where YES + NO < $1.00
- **Risk Controls**: Position sizing, daily loss limits, fee tolerance
- **Paper Mode**: Full simulation before live trading
- **Activity Log**: Real-time event stream (info, warnings, errors)
- **P&L Tracking**: Cumulative profit/loss with sparkline visualization
- **Pause/Resume**: Pause the scanner, toggle paper vs. live mode
- **Kill Switch**: Always-visible emergency stop button
- **Capital Management**: Track paper and live capital deposits

**Authentication & Security:**
- Supabase Auth for user login
- RLS policies: Dashboard can only access own data (user isolation)
- Bot uses service_role key (server-side only) to bypass RLS
- Never expose service_role key to client

**Deployment:**
- Vercel (frontend)
- Supabase (backend + database)

#### 🏗️ OPENCLAW (Infrastructure)
- **Slack Channel**: DMs
- **GitHub Org**: claudia-theloop
- **Repo**: openclaw
- **Description**: The OpenClaw Configuration
- **Status**: Claudia's core infrastructure

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

## Setup Progress (2026-03-01 - COMPLETE ✅)
- ✅ Revoked compromised API key (18:32 incident)
- ✅ Generated new API key 
- ✅ Configured in .zshrc (verified 18:53)
- ✅ Added to .env file for OpenClaw access (18:54)
- ✅ API key tested + verified working (18:55)
- ✅ Confirmed Gemini models available (gemini-2.0-flash, etc.)
- ✅ Updated openclaw.json with Gemini config (19:00+)
- ✅ Gateway restarted successfully (21:10)
- ✅ Configuration verified and complete (21:10)
- ✅ **Gemini embeddings OPERATIONAL** (21:42)
- ✅ **Hybrid search VERIFIED** (semantic 70%, keyword 30%)
- ✅ **Memory search tested and working** (21:42)

## Memory System Status
🎉 **FULLY OPERATIONAL**
- Provider: Gemini (gemini-embedding-001)
- Mode: Hybrid (semantic + BM25 + MMR + temporal decay)
- Indexing: MEMORY.md + memory/YYYY-MM-DD.md files
- Session memory: Enabled and tracking
- Last verified: 2026-03-01 21:42 GMT-5

---

*This file is updated periodically as I learn and experience new things with the team.*
