# 07 — Databases & Backend

> Edit any text below. Leave the `##` and `###` headings alone —
> they tell the build where each piece belongs.

## Supabase
*https://supabase.com*

### Built for
Built for: seed-to-Series-A teams and full-stack JS/TS developers who want a Postgres database with built-in auth, storage, and realtime instead of stitching separate services together, primarily to ship a relational-backed web or mobile app fast.

Best fit: when you want open-source Postgres you can self-host later and need auth plus realtime from one console.

### What it is
An open-source backend-as-a-service built around a standard Postgres database, bundling auth, storage, realtime and edge functions behind a single dashboard. Because the core is ordinary Postgres rather than a proprietary store, teams work directly in SQL instead of a vendor-specific data model.

### Database type
Relational database running standard PostgreSQL, so ordinary SQL, constraints and Postgres tooling all apply, with the pgvector extension available for storing and querying embeddings alongside application data, not in a separate vector service.

### What's bundled & what it connects to
One dashboard fronts Postgres plus auth, storage, realtime and edge functions, so the pieces share a single database rather than separate services. pgvector is available in the same Postgres instance for storing and querying embeddings, keeping vector search alongside relational data instead of a bolt-on service.

### Pricing, tiers & overage
A free tier covers early projects, with the Pro plan at $25/mo and usage-based overages beyond the included quotas. Costs then scale with consumption instead of a flat seat price, so heavier database, storage or function use pushes the bill up past the $25/mo base.

### Idle behavior (pausing & cold starts)
Free projects auto-pause after 7 days without API requests. The data is retained but the project must be resumed manually before it serves traffic again. Paid projects do not auto-pause. This pause behavior is specific to the free tier.

### Setup & time to value
A hosted dashboard provisions Postgres plus auth, storage and realtime. A working backend is available within minutes without assembling services. The managed Cloud path avoids the multi-service setup that self-hosting would otherwise require, shortening the time to a usable backend.

### Lock-in, portability & self-hosting
The data layer is standard Postgres. The database itself is portable, but running Supabase yourself means operating a heavy multi-service Docker stack: Postgres, GoTrue for auth, PostgREST, Realtime, Storage and Kong. Portability of the data is high. The operational cost of self-hosting the full platform is not.

### Maturity, community & support
Well-funded and widely adopted, with a large community around the project. That backing and adoption give it more resources and third-party material than the smaller open-source options here, which lowers the risk of building on it.

### Reliability
No published uptime SLA below the paid tiers appears in the sources used here. Free-tier reliability is best-effort with no contractual guarantee. Founders below paid or Enterprise plans have no committed uptime percentage to point to.

### Where it stands out
Delivers a full Postgres backend (database, auth, storage, realtime and edge functions) from one dashboard without stitching separate services together, while keeping the data in standard Postgres. The combination of a familiar SQL core and a bundled feature set is its main differentiator.

### Limitations
Self-hosting the full platform is heavy, requiring a multi-service Docker stack (Postgres, GoTrue, PostgREST, Realtime, Storage, Kong) to run yourself. On the managed side, free-tier projects pause after a period of inactivity, so the free option is not suited to always-on workloads.

### Choose this if you are…
Ideal for: founders who want a relational Postgres backend plus auth, storage, realtime, and edge functions bundled into one $0-to-$25 stack.

Best when: you need real SQL with joins, row-level-security policies, and a hosted Postgres you won't outgrow: the free tier gives 500MB DB, 50k MAU, and 2 projects (which auto-pause after ~1 week idle), while Pro at $25/mo bumps you to 8GB DB, 100k MAU, and $10 compute credit; pick it over Firebase when you refuse NoSQL, and over Neon/Convex when you want the whole backend not just the database engine.

Avoid if: you're a mobile-first app leaning on Google's ecosystem and offline sync (go Firebase), or you only want raw serverless Postgres with per-branch previews (go Neon).


## Firebase
*https://firebase.google.com*

### Built for
Built for: solo developers and early startups, often mobile-first with light backend experience, who want a fully managed NoSQL backend with auth, hosting, and push notifications out of the box.

Best fit: real-time mobile apps and MVPs where document data and Google's managed infrastructure beat running your own SQL layer.

### What it is
Google's mobile-first backend-as-a-service, bundling the Firestore/Realtime Database with Auth, Hosting, Messaging and Analytics. It is tied into the wider Google ecosystem and reached through native mobile SDKs, positioning it for teams building mobile-first products over SQL-centric backends.

### Database type
NoSQL document store organized as collections of documents, not tables, with realtime sync so clients receive updates as data changes and can keep working offline. It is queried through the Firebase SDKs, not SQL.

### What's bundled & what it connects to
Bundles Firestore and the Realtime Database with Auth, Hosting, Messaging and Analytics, and adds ML Kit alongside realtime data. The components are tightly bound to the Google ecosystem and consumed through Firebase's mobile SDKs, which deepens integration but also ties the stack to Google's platform.

### Pricing, tiers & overage
The Spark tier is free, while the Blaze plan is pay-as-you-go and billed by usage on a per-operation basis. That model means cost tracks operation volume directly, which is flexible at low usage but is the source of the per-operation billing surprises flagged as a risk.

### Idle behavior (pausing & cold starts)
There is no pause or cold-start concept for the database itself. Firestore is a pure request-billed serverless service, so an idle database costs only for stored data and incurs no compute to spin up. Activity simply resumes per-operation billing.

### Setup & time to value
Console-driven setup that is fast to reach a working state for mobile apps, with the native SDKs handling client wiring. Because everything runs on Google's managed platform, there is no infrastructure to stand up. In return, setup happens entirely within Google's console.

### Lock-in, portability & self-hosting
Proprietary in its data model, Security Rules and indexing, with no self-hosted equivalent to move to. Data can be exported via gcloud, but the rules, triggers and auth around it have no portable form and require a rewrite elsewhere, making this the highest-lock-in option here.

### Maturity, community & support
Backed by Google with a long operating track record and a large surrounding ecosystem. It is the most established option in this set, though that maturity comes packaged with the proprietary, no-self-hosting model that defines its lock-in.

### Reliability
Firestore runs on Google Cloud infrastructure, but no specific published availability SLA percentage appears in the sources used here. The signal is the platform's long operational track record under Google instead of a committed uptime number.

### Where it stands out
Combines realtime data with deep native mobile SDK coverage across iOS, Android, web and Flutter, all inside the Google ecosystem alongside analytics and messaging. For mobile-first teams already using Google services, that integration depth is what sets it apart.

### Limitations
No self-hosting and proprietary throughout, giving it the highest lock-in here, and its Blaze plan bills per operation, so usage-based charges can surprise as volume grows. Both constraints stem from the closed, Google-hosted model, not being configurable away.

### Choose this if you are…
Ideal for: mobile and realtime app builders who want Google's managed NoSQL, offline sync, push, and auth in one SDK.

Best when: you're shipping iOS/Android or a realtime chat/presence app and want Firestore's client-side offline cache and instant listeners. Spark free covers 50k reads / 20k writes / 20k deletes per day, 1GiB stored, and 2M Cloud Functions calls/month, and it hard-blocks instead of bills you when quotas hit; choose it over Supabase when you'd rather have battle-tested mobile SDKs and Google infra than SQL.

Avoid if: you need relational joins, complex queries, or transactions across tables (Supabase/Neon), or you fear Blaze's pay-as-you-go read/write metering ($0.06 per 100k reads) spiking unpredictably at scale.


## Neon
*https://neon.com*

### Built for
Built for: developers and teams wanting serverless Postgres with database branching, comfortable with SQL and any modern Postgres client, primarily to spin up per-branch preview databases in CI/CD.

Best fit: when you need autoscaling, scale-to-zero Postgres with Git-like branches, versus Supabase's all-in-one bundle or a fixed managed instance.

### What it is
Serverless PostgreSQL that separates storage from compute and adds instant branching. Databases can scale to zero and be forked cheaply while staying wire-compatible with standard Postgres. Acquired by Databricks in May 2025, after which its pricing was restructured.

### Database type
Relational PostgreSQL that is wire-compatible with standard Postgres. Existing drivers and connection strings work unchanged. Its distinctive traits are instant branching and scale-to-zero compute, and pgvector is available for embeddings.

### What's bundled & what it connects to
Database only: serverless PostgreSQL. You bring your own backend/API layer, auth and storage.

### Pricing, tiers & overage
Free plan gives 100 compute-hours (CU-hours) per month, 0.5GB storage per project and up to 100 projects. Paid compute is billed per CU-hour (Launch $0.106, Scale $0.222) plus storage at $0.35/GB-month. There is no monthly minimum, so cost is purely usage-based.

### Idle behavior (pausing & cold starts)
Compute scales to zero after an idle period, so an inactive database stops consuming compute. The next query triggers a cold start to resume it. Storage keeps billing continuously while compute is suspended, since storage and compute are separated and priced independently.

### Setup & time to value
Standard Postgres connection, fast for anyone who knows Postgres.

### Lock-in, portability & self-hosting
Being wire-compatible standard Postgres, connection strings and dumps port to any Postgres provider. The core database carries low lock-in. The branching feature is Neon-specific, so workflows built around instant branches would need rebuilding on a plain Postgres host.

### Maturity, community & support
Acquired by Databricks in May 2025, after which pricing was restructured in 2025-2026: storage fell from $1.75 to $0.35/GB-month, the free allowance doubled from 50 to 100 CU-hours, and the $5/mo minimum was removed. The changes were largely founder-favorable, but they are recent.

### Reliability
No published uptime SLA figure for Neon appears in the sources used here. What is documented is the operational model (scale-to-zero compute with a cold start on resume), not a committed availability percentage.

### Where it stands out
Instant, cheap branching plus scale-to-zero suits per-PR preview environments and AI/dev-tooling workflows that spin up many short-lived databases, forking is fast and idle branches consume little compute. Being wire-compatible Postgres, this arrives without giving up standard tooling.

### Limitations
Cold-start latency on the first query after scale-to-zero is the main operational tradeoff, and storage keeps billing while compute is suspended. The May 2025 Databricks acquisition, though it brought founder-favorable pricing, also adds some roadmap uncertainty for a recently-changed product.

### Choose this if you are…
Ideal for: teams that want only serverless Postgres, with instant database branching per pull request, and will bring their own auth and hosting.

Best when: you want a Postgres that scales to zero and forks a full copy of prod for every PR/preview like Git branches. The free plan gives up to 100 projects, 0.5GB storage and 100 compute-hours each, and paid compute is usage-based ($0.106/CU-hour on Launch, $0.222 on Scale) with no monthly minimum. Since Databricks acquired Neon in May 2025, compute prices have dropped 15-25%. Pick it over Supabase when you don't want a bundled BaaS, and over Turso when you need Postgres, not edge SQLite.

Avoid if: you want auth/storage/realtime included (Supabase or Convex), or you need embedded/edge-local reads per tenant (Turso).


## Turso
*https://turso.tech*

### Built for
Built for: developers building edge and local-first apps who want SQLite (libSQL) replicated close to users, primarily for low-latency reads at the edge and embedded or offline sync.

Best fit: read-heavy, globally distributed apps needing many per-tenant databases, versus a single centralized Postgres or Mongo cluster.

### What it is
Managed SQLite/libSQL database built to run at the edge using embedded replicas kept close to the application, aimed at low-latency reads for edge and serverless apps. It is SQLite-compatible via the libSQL fork and uses a single-writer model.

### Database type
Relational and SQLite-compatible through the libSQL fork. The SQLite dialect and tooling apply. It uses a single-writer model, which fits read-heavy edge workloads more than write-concurrent ones, with embedded replicas serving local reads.

### What's bundled & what it connects to
Database only: managed SQLite/libSQL at the edge with embedded replicas, bring your own backend/auth/storage.

### Pricing, tiers & overage
Free tier covers 100 databases and roughly 5GB. Developer is $4.99/mo (unlimited databases, ~9GB). Paid: Scaler $24.92/mo (24GB) and Pro $416.58/mo (50GB, adds SSO/BYOK/HIPAA/SOC2), with custom Enterprise above, per Turso's current pricing page.

### Idle behavior (pausing & cold starts)
There is no documented per-database pause or cold-start cycle, but requests are served without an explicit resume step. Combined with edge-resident embedded replicas, reads are answered locally, not by waking a suspended primary.

### Setup & time to value
SQLite-simple to start. Create a database in seconds via CLI or dashboard with no server to manage; the real learning curve is embedded/edge replication and per-tenant databases, which is new even to SQL-comfortable teams.

### Lock-in, portability & self-hosting
libSQL is SQLite-compatible. Local database files can be read with standard SQLite tooling, keeping the data itself portable. The edge sync layer and the hosted service are Turso-specific, so it is the embedded-replica setup, not the data that ties you to the platform.

### Maturity, community & support
The smallest and newest company of the five, with pricing tiers that have been introduced or revised comparatively recently. That leaves less of a track record for how stable the current Free, Developer, Scaler and Pro structure will prove over time.

### Reliability
As the smallest and newest platform of the five, Turso has less independently documented reliability history, and no widely published uptime SLA outside Enterprise appears in the sources used here: limited public incident history and no committed availability number below Enterprise.

### Where it stands out
Low-latency edge reads via embedded SQLite replicas kept next to the application, which fits read-heavy edge and serverless apps. It also has among the cheapest entry pricing here, with a $4.99/mo Developer tier offering unlimited databases above the free tier.

### Limitations
The SQLite single-writer model constrains write concurrency. It fits read-heavy workloads better than write-heavy ones. As the smallest and newest vendor here it also has the smallest ecosystem and hiring pool, and no widely published uptime SLA outside Enterprise.

### Choose this if you are…
Ideal for: builders needing edge-local, low-latency reads or a separate SQLite database per customer (multi-tenant isolation).

Best when: you're doing database-per-tenant at scale or serving read-heavy globally-distributed users: libSQL replicates SQLite to the edge with no cold starts, and the free tier covers 100 databases, 5GB storage and 500M row reads/month, with Developer at $4.99/mo and Scaler at $24.92/mo. Choose it over Neon when you want SQLite's cheap per-DB model and edge latency over centralized Postgres, and over MongoDB when your data is relational and small-per-tenant.

Avoid if: you need heavy concurrent writes, Postgres extensions/features, or a single large shared database (Neon/Supabase), or a document model (MongoDB Atlas).


## MongoDB Atlas
*https://www.mongodb.com/atlas*

### Built for
Built for: teams from startup to enterprise and developers preferring document/NoSQL modeling at any technical level, primarily for flexible-schema apps, search, and analytics on managed MongoDB across clouds.

Best fit: when data is document-shaped and evolving and you need mature scaling, sharding, and full-text or vector search.

### What it is
Fully managed cloud MongoDB, the NoSQL document database, offered across AWS, Azure and GCP with multi-region deployment. It stores BSON documents with a dynamic schema and layers Atlas Search and Vector Search on top of the managed clusters.

### Database type
NoSQL document store: data is held as BSON documents with a dynamic schema instead of fixed relational tables, but document shape can vary within a collection. It suits applications whose data models change or nest, and uses the MongoDB wire protocol and drivers.

### What's bundled & what it connects to
Database only: managed NoSQL document DB; bring your own backend/auth/storage (Atlas adds Search/Charts as add-ons).

### Pricing, tiers & overage
The free M0 cluster provides 512MB with no backups. Above it sits a usage-based Flex tier capped at roughly $30/mo, and dedicated clusters that start at the M10 size for $0.08/hour billed by uptime. The step to dedicated is where production-grade features appear.

### Idle behavior (pausing & cold starts)
Free and shared clusters auto-pause after prolonged inactivity and must be resumed, whereas dedicated M10+ clusters run continuously and do not pause. Idle behavior therefore tracks the tier. The free M0 can sleep, while paid dedicated capacity stays on.

### Setup & time to value
Quick to spin up, but needs NoSQL data-modeling discipline.

### Lock-in, portability & self-hosting
mongodump/mongorestore and the official drivers work against any MongoDB-compatible deployment; portability within the MongoDB ecosystem is high and moving between hosts or self-managed clusters is straightforward. Such lock-in as exists comes from the document model itself.

### Maturity, community & support
The most mature offering in this set, run by a public company (NASDAQ: MDB), with a long and comparatively stable pricing structure spanning the free M0, Flex and dedicated M10+ tiers. It is the least likely of the five to see abrupt free-tier or pricing changes.

### Reliability
Dedicated M10+ clusters carry an uptime SLA with service credits, while the free and shared tiers do not. The exact current SLA percentage is not documented in the sources used here, though the tiered-SLA structure itself is.

### Where it stands out
A flexible document schema plus a large, well-established driver, tooling and hiring ecosystem that most stacks already know, backed by a mature public company across AWS, Azure and GCP. Atlas Search and Vector Search extend it without leaving the managed platform.

### Limitations
The free M0 tier has no backups and no SLA. Production-grade reliability requires stepping up to a dedicated M10+ cluster from $0.08/hour. The document model also demands NoSQL modeling discipline, since schema flexibility can turn into inconsistency without deliberate design.

### Choose this if you are…
Ideal for: teams whose data is document-shaped and want flexible schemas plus an expressive aggregation pipeline, managed globally.

Best when: your entities are nested/variable (catalogs, events, user profiles with sparse fields) and you'll lean on aggregation pipelines and horizontal sharding: the free M0 cluster gives 512MB, the Flex tier caps at $30/mo, and dedicated M10 starts ~$0.08/hr (~$58/mo) climbing with RAM. Pick it over Supabase/Neon when you'd rather not force a relational schema, and over Firebase when you want a query language and cloud portability (AWS/GCP/Azure).

Avoid if: your data is relational with joins and constraints (Neon/Supabase), or you want a full BaaS with auth/realtime baked in (Supabase/Convex).


## Convex
*https://www.convex.dev*

### Built for
Built for: full-stack TypeScript developers at early-stage startups who want a reactive backend bundling database, server functions, and realtime into one strongly typed platform.

Best fit: TS-first apps needing live-updating queries and server logic without managing a separate database, API layer, and websocket infrastructure.

### What it is
A reactive backend platform where application logic is written as TypeScript functions and query results sync to clients in realtime by default. It bundles reactive queries, file storage, vector search and auth. Open-sourced in 2024 with self-hosting added, so the code-first model is not strictly tied to the vendor cloud.

### Database type
Its own reactive document/relational store with TypeScript queries and realtime sync. It is not a standalone SQL/NoSQL engine you bring.

### What's bundled & what it connects to
TypeScript functions, reactive queries, file storage, vector search and built-in auth are combined into one reactive platform. Query results propagate to clients as the underlying data changes. Realtime sync is part of the core, not a separate service you wire up yourself.

### Pricing, tiers & overage
Free tier includes 1M function calls/mo, 0.5GB database storage and 1GB file storage. Paid: Professional $25/developer/mo (50GB database storage, 25M function calls); Business/Enterprise from ~$2,500/mo minimum. Cost scales by usage (function calls, storage) plus a per-developer seat.

### Idle behavior (pausing & cold starts)
Cold starts can occur after a deployment sits idle, but Convex does not aggressively scale to zero. A deployment is only treated as idle after 30 days with no function calls (deploy fee then waived). For most small apps the cold-start delay is minor.

### Setup & time to value
A code-first setup where backend logic is written as TypeScript functions and realtime sync works out of the box, so reactive behavior does not need separate configuration. Time to value depends on comfort with the code-first workflow instead of clicking through a dashboard.

### Lock-in, portability & self-hosting
Open-sourced in 2024 with self-hosting available since early 2025, running under Docker with data in either SQLite or Postgres. That combination hedges lock-in for a code-first platform. The backend logic and its store can be moved off the vendor cloud onto self-managed infrastructure.

### Maturity, community & support
Newer than the incumbents but funded, and its codebase was open-sourced in 2024, which is a community hedge. If the company's direction changed, the self-hostable code remains available. Maturity is lower, but the open source acts as a fallback.

### Reliability
Publishes a public status page (status.convex.dev). Third-party monitors report ~99.16-99.73% 30-day uptime vs Convex's stated ~99.99% availability target (a target, not a contractual SLA), with 40+ mostly-minor incidents logged over the ~5 months to Jul 2026 (e.g. a 15 Jul 2026 failure pushing Node Actions). Fine for early apps, but watch the SLA gap.

### Where it stands out
Provides reactive, realtime data out of the box through a code-first TypeScript model, so query results sync to clients as data changes without extra wiring. For realtime and AI apps built in TypeScript, having reactivity as a default instead of an add-on is the standout.

### Limitations
It is a newer platform than the incumbents and carries a shorter track record, and its code-first model differs from the dashboard-driven style of most BaaS tools. Teams expecting a click-through console instead of writing TypeScript functions face an adjustment.

### Choose this if you are…
Ideal for: TypeScript-first teams who want a reactive backend where queries, mutations, functions and the database are one typesafe system with real-time subscriptions built in.

Best when: you want end-to-end type safety and live-updating queries with zero websocket plumbing: write server functions in TS and the client re-renders automatically. Free covers up to 6 devs, 1M function calls, 20 GB-hours compute, 0.5GB database and 1GB file storage, Pro at $25/mo. Choose it over Firebase for typesafe reactivity without NoSQL footguns, and over Supabase when you want functions+DB fused instead of raw SQL access.

Avoid if: you need raw SQL, existing Postgres tooling/ORMs, or portable standard queries (Neon/Supabase), or a document store at scale (MongoDB Atlas).


## Manual DIY

### Built for
The build-it-yourself lane: rent a raw Linux box, install Postgres (or Supabase's OSS stack) yourself, hand-write SQL and your own API. Max control and zero per-seat fees. You are now the DBA, SRE, and on-call.

### What it is
A self-hosted relational database you provision, patch, and back up on a VPS, plus a REST/GraphQL layer you code in Node/Go/Python. No dashboard, no managed magic. Just Postgres and your own glue.

### Database type
Postgres by default: relational/SQL, ACID, JSONB for semi-structured data, extensions (PostGIS, pgvector). Swap in MySQL, SQLite, or add Redis/Mongo yourself if the workload needs it. You choose the engine.

### What's bundled & what it connects to
Nothing bundled. You assemble it. Supabase-OSS adds auth, storage, realtime and PostgREST if the whole stack is self-hosted. Connects to anything. It's your own API, open to any client, queue or service you wire up.

### Pricing, tiers & overage
No tiers, no overage bills: flat VPS rent (~$5-40/mo Hetzner/DO for small, more as you add RAM/CPU/disk). Cost is your TIME to set up and maintain. Beats managed pricing only long-term if you keep using it and don't value your hours highly.

### Idle behavior (pausing & cold starts)
No auto-pause, no cold starts: the box runs 24/7 and you pay whether idle or busy. Upside: no first-query lag ever. Downside: you burn rent on an idle MVP and must script your own scale-to-zero if you want it.

### Setup & time to value
Slow: hours to days. Provision VPS, secure SSH/firewall, install Postgres, configure backups, write migrations and the API layer. Docker-compose or Coolify shortcuts it, but time-to-first-query is far behind a managed one-click.

### Lock-in, portability & self-hosting
Zero lock-in: it IS self-hosting. Plain Postgres dumps move anywhere. No proprietary API to unwind. Maximum portability is the whole point and the strongest reason to DIY over a managed vendor.

### Maturity, community & support
Postgres is decades-mature with a massive community, but support is DIY: Stack Overflow, docs, forums. No SLA, no support desk, no one to page at 3am but you. Fine for MVPs, risky once real users depend on uptime.

### Reliability
Only as reliable as you make it. Single VPS = single point of failure. No automatic failover, replication, or PITR unless you build it. Managed rivals give HA out of the box. Here reliability is whatever your engineering makes it.

### Where it stands out
Total control, no per-row/egress/seat fees, no lock-in, predictable flat cost, and free rein over extensions and tuning. Cheapest at scale if you already have ops skill and want to own the whole stack.

### Limitations
Breaks past small scale: no built-in HA, backups, or scaling without heavy work, but security is on you (a misconfigured Postgres is a breach). No polished console. Ops burden compounds, the classic DIY trap as users grow.

### Choose this if you are…
Ideal for: founders with real ops skills or hard data-residency/compliance mandates who want zero vendor markup and total control of their database.

Best when: regulation forces data to live on infrastructure you control, or you're cost-optimizing a predictable workload: a $5-20/mo Hetzner/DigitalOcean VPS running Postgres costs a fraction of managed tiers, and you own tuning, extensions, and residency completely. Pick this over Supabase/Neon only when the control outweighs the maintenance.

Avoid if: you're pre-seed and should be shipping product, not owning backups, patching, failover, and connection pooling, and 3am pages. The managed free tiers of Supabase or Neon get you to product-market fit far faster with less risk.

