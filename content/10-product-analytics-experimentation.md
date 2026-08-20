# 10 — Product Analytics & Experimentation

> Edit any text below. Leave the `##` and `###` headings alone —
> they tell the build where each piece belongs.

## PostHog
*https://posthog.com*

### Built for
Built for: product and engineering teams wanting analytics, session replay, feature flags, and experiments in one open-source, self-hostable platform.

Best fit: startups wanting an all-in-one product suite they can self-host and keep data in, versus buying separate analytics and feature-flag tools.

### What it is
An MIT-licensed all-in-one platform combining product analytics, session replay, feature flags, A/B experiments, surveys, error tracking, and a data warehouse in a single tool.

### Pricing & free tier
Usage-based with a very generous free tier: 1M events, 5K web + 2.5K mobile recordings, 1M feature-flag requests (experiments billed with flags), no card. Self-host is MIT-licensed and free.

### Autocapture & instrumentation
Autocaptures clicks and pageviews via a JS snippet, plus manual/custom events; supports server-side ingestion and reverse-proxy setups for first-party data.

### Retention, funnels & cohorts
Full funnels, retention, user paths, trends, and static/dynamic behavioral cohorts are included on every plan, including the free tier, with no gating on core analysis.

### Session replay
Native web and mobile (iOS/Android/React Native/Flutter) replay is bundled; 5K web + 2.5K mobile recordings free per month, then usage-priced, linked to analytics events.

### Experimentation & feature flags
Feature flags, multivariate flags, and A/B/n experiments with a built-in stats engine are included free (1M flag requests/mo). Experiment cost is billed via flag request volume.

### Web vs mobile SDKs
JavaScript/Web SDK plus native iOS, Android, React Native, and Flutter SDKs, and many server SDKs (Python, Node, Go, Ruby, PHP, etc.).

### Integrations
CDP-style pipelines with 60+ sources/destinations, warehouse sync (BigQuery, Snowflake, Postgres), Segment import, Zapier, and reverse-ETL between products.

### Where it stands out
The only major tool that is open-source and self-hostable while bundling analytics + replay + flags + experiments together under one unusually generous free plan.

### Limitations
Breadth over depth: individual modules (replay, warehouse) are less mature than specialists, and 4x event-overage math plus self-host ops can surprise growing teams.

### Choose this if you are…
Ideal for: founders who want product analytics, session replay, feature flags, experiments, and surveys unified under one usage-based bill (and optionally self-hosted).

Best when: you want one tool covering funnels, retention, replays, and A/B tests instead of stitching several. The free tier is a fat 1M events/month with no base fee, and everything's in one dashboard. Choose it over Amplitude/Mixpanel when you also want replay and flags bundled, and over Statsig when analytics breadth matters as much as experimentation.

Avoid if: PostHog's identified-event pricing (identified events can cost up to ~4x anonymous) surprises you at scale, or you need the polished enterprise-grade behavioral depth and org controls of Amplitude for a large analytics team.


## Amplitude
*https://amplitude.com*

### Built for
Built for: product managers and growth teams at scaling companies needing deep behavioral analytics, funnels, retention, and cohorting across web and mobile.

Best fit: data-driven product orgs doing serious funnel and retention analysis where analytical depth and governance outweigh lighter, faster tools.

### What it is
A behavioral/product analytics platform extended into a full suite with native session replay, web analytics, an included CDP, and lightweight experimentation and feature flags.

### Pricing & free tier
Free plan forever: 2M events/month with 10K monthly session replays, no card required. Plus starts at $0 and is usage-based (first 2M events/month free, then event-based pricing up to 70M events). Growth and Enterprise are custom-quoted, also event-based.

### Autocapture & instrumentation
Supports autocapture / no-code event streaming plus SDK-based custom events, with a data-governance layer for taxonomy, naming, and schema control.

### Retention, funnels & cohorts
Deep funnels, retention, user journeys, and behavioral cohorts, its historical core strength and a common reason enterprises adopt it.

### Session replay
Native Session Replay is included on all plans (Free tier 10,000 sessions/mo, Growth 20,000/mo, Enterprise 50,000/mo), tightly tied to captured analytics events for qualitative context.

### Experimentation & feature flags
Basic feature flags and web experimentation are now included on all plans, including free. Advanced, server-side experimentation is a paid add-on module.

### Web vs mobile SDKs
Browser JavaScript plus native iOS, Android, React Native, Flutter, and Unity SDKs, and multiple server-side SDKs.

### Integrations
100+ integrations, Segment, warehouse connectors (Snowflake, BigQuery, Redshift), reverse-ETL, and an included customer data platform (CDP).

### Where it stands out
Deep analytics and cohorting with enterprise governance controls, plus a free tier that bundles session replay and basic experimentation.

### Limitations
Event-based pricing can still get expensive at volume. Advanced experimentation and higher volumes get pricey. Heavier taxonomy/setup than autocapture-first tools for small teams.

### Choose this if you are…
Ideal for: product teams that need deep behavioral analytics (detailed cohorts, funnels, and retention) at enterprise scale.

Best when: understanding user behavior is central and you want extensive cohorting/funnel/retention analysis, now with feature flags and session replay bundled. The free plan gives 2M events/month (10K session replays included), Plus starts at $0 usage-based with the first 2M events free, and pricing is event-based with unlimited seats. Choose it over Mixpanel when analytical depth wins, and over PostHog when you want a focused analytics suite.

Avoid if: high event volumes could make usage-based bills climb, or you want an all-in-one cheap tool with replay+flags (PostHog).


## Mixpanel
*https://mixpanel.com*

### Built for
Built for: product and marketing teams wanting event-based analytics with fast, self-serve reports, funnels, and dashboards at a low learning curve.

Best fit: teams wanting quick event tracking and interactive reports without heavy setup, versus Amplitude's deeper but heavier analytical suite.

### What it is
A self-serve, event-based product analytics tool centered on funnels, retention, and Flows, now extended with native session replay and (since 2025) autocapture.

### Pricing & free tier
Free plan: 1M events/mo, no card, including 10K session replays/mo and core reports. Growth is free for the first 1M events then ~$0.00028/event, with unlimited seats.

### Autocapture & instrumentation
Added Autocapture in Feb 2025, available on all plans; it captures pageviews, clicks, and form fills with no code, alongside traditional SDK-defined custom events.

### Retention, funnels & cohorts
Strong funnels, retention, and Flows plus behavioral cohorts, though cohorts and some advanced properties are gated off the free plan and require Growth+.

### Session replay
Native web and mobile session replay is bundled, with 10K replays per month even on the free plan, linked to the underlying event stream.

### Experimentation & feature flags
No native feature flags or experiment delivery. Offers A/B report analysis but relies on warehouse/integrations or third-party flag tools to run tests.

### Web vs mobile SDKs
JavaScript/Web SDK plus native iOS, Android, React Native, and Flutter SDKs, and server-side SDKs (Python, Node, etc.).

### Integrations
Segment, mParticle, warehouse connectors (BigQuery, Snowflake), Slack, and 100+ integrations for ingestion and downstream syncing.

### Where it stands out
Fast, self-serve analytics UX paired with a large free tier and simple, transparent per-event pricing.

### Limitations
Feature flags and experimentation exist but sit high up: built into Enterprise, a paid add-on on Growth. Cohorts and custom properties are gated off the free plan, and event-based pricing can spike with high-volume tracking.

### Choose this if you are…
Ideal for: teams that want fast, interactive event analytics with predictable, event-based billing.

Best when: you value forecastable costs and snappy self-serve reports; since switching fully to event-based pricing (Feb 2025), bills scale cleanly with volume: free covers 1M events, then Growth is usage-based at about $0.28 per 1,000 events above the free 1M (e.g. ~$140/mo at 1.5M events), with 20K session replays included. Choose it over Amplitude for the longer track record of its event-based model (Amplitude now bills by events too, so the old MTU-spike argument is gone), and over PostHog when you want a focused analytics tool without the extra products.

Avoid if: you need session replay and feature flags bundled in (PostHog), or your team wants Amplitude's deeper enterprise behavioral modeling for large-scale analysis.


## Google Analytics
*https://marketingplatform.google.com/about/analytics/*

### Built for
Built for: marketers and site owners of any size tracking web and app traffic, acquisition channels, and conversions for free. / Best fit: marketing-driven site analytics and attribution, versus product event tools; a common choice when budget is zero and reach matters.

### What it is
Google's free, event-based web and app analytics platform (GA4) for measuring traffic, acquisition, engagement, conversions, and campaign attribution.

### Pricing & free tier
Free for standard GA4 (subject to sampling and quota limits). The enterprise GA360 tier is custom six-figure pricing. No product-team-specific pricing exists.

### Autocapture & instrumentation
"Enhanced measurement" auto-tracks pageviews, scrolls, outbound clicks, site search, and file downloads. Deeper events require gtag.js or Google Tag Manager configuration.

### Retention, funnels & cohorts
Funnel, path, cohort, and retention Explorations exist but are less flexible and product-focused than dedicated tools, and data sampling kicks in at scale.

### Session replay
No native session replay. GA4 does not record user sessions. Teams pair it with dedicated tools (Microsoft Clarity, Hotjar, FullStory) for qualitative playback.

### Experimentation & feature flags
No native A/B testing since Google Optimize sunset on Sep 30, 2023. It requires third-party tools (Optimizely, VWO) or Firebase for app-side experiments.

### Web vs mobile SDKs
gtag.js and Google Tag Manager for web. Mobile is captured via Firebase SDKs (iOS/Android) that feed data into GA4.

### Integrations
Deep Google ecosystem ties (Google Ads, Search Console, and free BigQuery export), plus a wide range of third-party connectors.

### Where it stands out
Free, widely used, and strong for marketing and acquisition analytics and Google Ads attribution, with a large community and documentation.

### Limitations
Not a true product-analytics tool: clunky behavioral analysis, data sampling, no replay, no native experimentation, and a notably steep GA4 learning curve.

### Choose this if you are…
Ideal for: founders tracking top-of-funnel web traffic, acquisition channels, and marketing/SEO performance, for free.

Best when: you need to know where visitors come from, which campaigns convert, and how your marketing site and Google Ads perform. GA4 is free and integrates natively with the Google Ads/marketing stack for attribution. Choose it over the product-analytics tools when the question is where your traffic and acquisition come from, not how users behave inside your app.

Avoid if: you need real product analytics (user-level event streams, precise funnels, cohorts, and retention), because GA4 samples data and isn't built for in-app behavioral analysis; go PostHog, Mixpanel, or Amplitude for anything past marketing measurement.


## Heap
*https://www.heap.io*

### Built for
Built for: product and growth teams wanting autocapture of every interaction so events can be analyzed retroactively without pre-instrumenting the app.

Best fit: teams that don't want to define events upfront and value retroactive analysis, versus manual event tracking that misses what you forgot to log.

### What it is
An autocapture-first digital/product analytics platform, now owned by Contentsquare, that retroactively records all user interactions without predefined events.

### Pricing & free tier
Free plan up to ~10K sessions/mo with core analytics and 6-month history, but Growth, Pro, and Premier tiers are custom-quoted (Growth reportedly ~$3,600/yr). Pricing is opaque.

### Autocapture & instrumentation
Its defining feature: retroactive autocapture of every click, pageview, and form interaction, letting you define events after the fact with no code changes or replays lost.

### Retention, funnels & cohorts
Full funnels, retention, paths, and segments built on retroactively captured data, plus strong journey analysis across the full interaction history.

### Session replay
Native session replay is available, typically as an add-on rather than bundled by default, alongside heatmaps and Contentsquare experience analytics.

### Experimentation & feature flags
No native feature flags or experiments. It pairs with Contentsquare experience analytics or third-party experimentation tools to run and analyze tests.

### Web vs mobile SDKs
Web JavaScript SDK plus native iOS, Android, and React Native SDKs for autocapture across surfaces.

### Integrations
Warehouse connectors (Snowflake, BigQuery, Redshift), Segment, Salesforce, HubSpot, and native Contentsquare experience-data integration.

### Where it stands out
Retroactive autocapture means no lost data from un-instrumented events, plus integration with Contentsquare's experience-analytics suite.

### Limitations
Autocapture creates data noise and governance overhead. Session replay is an add-on. Pricing is opaque and enterprise-leaning; no native experimentation or flags.

### Choose this if you are…
Ideal for: teams that don't want to manually instrument events and prefer to autocapture everything, then define metrics retroactively.

Best when: you're moving fast and don't want to pre-plan a tracking plan; Heap autocaptures every click, pageview, and interaction so you can define funnels and events after the fact, analyzing behavior that happened before you thought to track it. Choose it when retroactive autocapture and never missing an event is the priority.

Avoid if: you want that same autocapture with transparent, cheaper, all-in-one pricing (PostHog also autocaptures and bundles replay/flags), or you prefer predictable event-based billing and mature reporting (Mixpanel); Heap's differentiation is thinner now that rivals autocapture too.


## Statsig
*https://www.statsig.com*

### Built for
Built for: engineering and product teams running feature flags, experiments, and A/B tests at scale, with a warehouse-native deployment option.

Best fit: experimentation-heavy orgs needing a rigorous stats engine and gradual rollouts, versus analytics-first tools that treat testing as an add-on.

### What it is
A feature-flagging and experimentation platform with built-in product analytics and session replay, designed for engineering-driven testing and gated rollouts at scale.

### Pricing & free tier
Large free tier: 2M events/month with unlimited feature-flag and config checks, 50K session replays and core experimentation; advanced stats (CUPED, sequential testing) sit on Pro/Enterprise. Pro starts $150/mo with 5M events included, then $0.05 per additional 1K.

### Autocapture & instrumentation
Autocapture for web analytics plus SDK-based event logging, with automatic exposure logging tied to every flag check and experiment assignment.

### Retention, funnels & cohorts
Product analytics with funnels, retention, and metric explorers, tightly coupled to experiment metrics so tests and analysis share the same definitions.

### Session replay
Native session replay is included and integrated with experiments and analytics, letting you tie qualitative playback back to test exposures.

### Experimentation & feature flags
Its core strength: Unlimited feature gates and core experimentation (multi-variate, Bayesian and frequentist) available even on the free tier; advanced statistical techniques like CUPED, sequential testing and holdouts sit on Pro and Enterprise.

### Web vs mobile SDKs
30+ SDKs (JavaScript/Web, iOS, Android, React Native, Flutter), plus many server-side SDKs (Node, Python, Go, Java, etc.).

### Integrations
Warehouse-native mode (Snowflake, BigQuery, Databricks), Segment, Slack, and analytics/CDP connectors for both ingestion and metric sourcing.

### Where it stands out
The most generous free experimentation offering paired with a statistically rigorous engine, and it scales to very high volume more cheaply than most rivals.

### Limitations
Analytics and replay are less mature than dedicated specialists. Ownership is in flux. OpenAI acquired Statsig (Sep 2025) and the brand/platform moved to Amplitude (2026).

### Choose this if you are…
Ideal for: teams whose core need is experimentation and feature flags with a rigorous stats engine, with analytics riding alongside.

Best when: A/B testing and controlled rollouts are central and you want a warehouse-grade experimentation platform with product analytics attached. The free tier is large: 2M events/month, unlimited flag and config checks, 50K session replays and unlimited seats; Pro ($150/mo) includes 5M events with $0.05 per additional 1k. Choose it over Amplitude/Mixpanel when experimentation is the point, and over PostHog when statistical experiment rigor and generous free flags matter most.

Avoid if: your primary need is behavioral product analytics (funnels, cohorts, retention depth) where Amplitude or Mixpanel lead, or you want session replay and surveys bundled in too (PostHog).


## Manual DIY

### Built for
Self-host the analytics instead of renting it: run PostHog, Umami, or Plausible on your own box, or just log events to Postgres and query with SQL/Metabase. Own your data, dodge event-volume billing. Privacy- and cost-conscious founders who want data on their own servers and are fine doing ops. Great for MVPs and EU/GDPR needs. Not for teams wanting a zero-setup hosted console and instant dashboards.

### What it is
A self-run analytics stack. PostHog-OSS gives near-full product analytics on your infra; Umami/Plausible give lightweight web stats. The rawest path is an events table plus SQL and a Metabase dashboard you build.

### Pricing & free tier
Software is free/open-source. You pay only the VPS it runs on (flat, low). No per-event pricing, the whole point versus metered SaaS that bills as you grow. Cost is setup/maintenance time, one-time-ish, cheaper long-term at high volume.

### Autocapture & instrumentation
PostHog-OSS keeps autocapture (clicks/pageviews auto-tracked) plus manual events via SDK. Plausible/Umami are pageview-focused with light custom events. Pure DB approach = fully manual instrumentation you code for every event.

### Retention, funnels & cohorts
Self-hosted PostHog delivers funnels, retention, and cohorts like the cloud version. Umami/Plausible don't. They're traffic stats, not product analytics. Roll-your-own means writing every funnel/cohort as SQL yourself.

### Session replay
Only PostHog-OSS offers it self-hosted, and replay is storage- and CPU-heavy. It can strain a modest VPS. Umami/Plausible have none; a DIY events table can't replay sessions. Budget real infra if you want this at scale.

### Experimentation & feature flags
PostHog-OSS includes feature flags and A/B experiments self-hosted, a genuine edge. Umami/Plausible and the raw-SQL route have none. You'd bolt on a separate flag library or build gating logic yourself.

### Web vs mobile SDKs
PostHog ships web + mobile (iOS/Android/RN) SDKs that also point at self-hosted. Plausible/Umami are web-first with thin mobile support. DIY logging works anywhere but you write and maintain each client integration.

### Integrations
Fewer than hosted. Self-hosted PostHog has many but some cloud integrations/apps lag. Umami/Plausible are minimal. Raw-DB approach connects to anything via SQL but every pipe (warehouse, CRM) is yours to build.

### Where it stands out
Full data ownership, GDPR-friendly, no event-volume billing, and PostHog-OSS gives analytics+replay+flags in one self-hosted stack. Best for privacy-driven or high-volume products willing to run the infra.

### Limitations
Ops-heavy: PostHog self-hosting is resource-hungry and can be fragile at scale (its own team nudges you to cloud); Umami/Plausible are shallow. Raw SQL means building everything. Breaks when data volume or feature depth grows.

### Choose this if you are…
Ideal for: privacy-conscious or data-sovereignty-driven teams who want to own every analytics event with no per-event fees.

Best when: GDPR/data-ownership rules or principle demand analytics on infrastructure you control. Self-host PostHog for full product analytics, Plausible for lightweight privacy-first web metrics, or log events straight to your own Postgres for total control and no vendor billing. Choose this when ownership and privacy outweigh convenience.

Avoid if: you're pre-seed and maintaining ClickHouse/PostHog infra or building dashboards from raw logs is a distraction from product. The cloud free tiers (PostHog's 1M events, Statsig's 2M events, GA4's free web analytics) more than cover early-stage needs with zero ops burden.

