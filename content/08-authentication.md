# 08 — Authentication

> Edit any text below. Leave the `##` and `###` headings alone —
> they tell the build where each piece belongs.

## Clerk
*https://clerk.com*

### Built for
Built for: startups and product teams on React/Next.js who want prebuilt auth UI, user management, and organizations dropped in fast with low-to-mid backend effort.

Best fit: B2C and B2B SaaS wanting polished drop-in components and multi-tenant orgs quickly, versus hand-wiring flows or configuring a heavier identity platform.

### What it is
A hosted authentication service aimed at developers, bundling pre-built UI components with user management. It runs as a managed identity layer instead of a library, so the user store and auth flows live on Clerk's infrastructure and integrate through its Next.js/React SDKs.

### Pricing & MAU cost (+ the cliff)
Free tier covers 50,000 MRU (monthly retained users, a narrower unit than MAU) as of the Feb 2026 update. The Pro plan is $25/mo and also includes 50,000 MRU, with additional users at $0.02/MRU (volume discounts higher up), at 100K MRU that works out to roughly $1,025/mo, the steepest per-user scaling among these five as volume grows.

### Setup speed & pre-built UI
The fastest to get live here, since drop-in pre-built components handle the auth UI, not requiring you to build flows. That speed is the main reason teams reach for it, and it pairs with the Next.js/React SDKs where the components are best supported.

### Auth methods & protections
Supports passwords, social login, passwordless, MFA, and device and session management, with bot and abuse protection included. The method coverage is delivered through the hosted service and its pre-built components instead of requiring you to assemble each flow yourself.

### Enterprise SSO/SAML
Available on higher plans but not the product's primary focus, which is developer-oriented hosted auth and pre-built UI. Enterprise SSO is present, not the specialty. Teams whose main need is SAML/SCIM at scale are not its core audience.

### Organizations & multi-tenant
Ships with built-in organizations and multi-tenant primitives as part of the hosted service, so team and tenant structures are provided instead of modeled from scratch. This aligns with its developer-oriented, drop-in positioning.

### Lock-in & migration
Users live in Clerk's hosted store. Export is supported, but because the auth flows and user store run on Clerk's infrastructure, moving off requires re-integration into a new provider instead of just relocating data.

### Maturity, trust & support
Well-funded and widely adopted, with developer support that matches its developer-first positioning. It is an established hosted vendor, though newer than Okta-owned Auth0, and its standing rests on adoption within the React/Next.js community.

### Where it stands out
Its edge is developer experience and pre-built UI. Drop-in components and Next.js/React SDKs get hosted auth live faster than assembling flows yourself. That speed-to-integration is what distinguishes it within its target ecosystem.

### Limitations
MAU pricing scales steeply as you grow (roughly $1,000/mo at 100K MAU, the steepest here), and the product is at its best within the React/Next.js ecosystem. Teams on other stacks, or scaling to high user counts, feel the cost and fit constraints most.

### Choose this if you are…
Ideal for: React/Next.js founders who want prebuilt drop-in auth UI, organizations, and MFA working in an afternoon.

Best when: you're on React/Next and want prebuilt SignIn components, user profiles, and B2B org management without building screens. The free tier is 50k MRU (monthly retained users, a narrower unit than the MAU rivals meter, so bills run lower), Pro is $25/mo, Business $300/mo. Choose it over Auth0 when you want quicker integration and prebuilt UI, and over Supabase Auth when you want prebuilt components and org/team features out of the box.

Avoid if: you're not in the React/Next ecosystem, need turnkey enterprise SSO/SCIM reselling (go WorkOS), or want to fully own user data with no per-user fees (Better Auth).


## Auth0
*https://auth0.com*

### Built for
Built for: mid-market to enterprise teams and security-conscious engineers needing broad protocol support, extensible rules/actions, and compliance across any stack or language.

Best fit: complex identity needs (many connections, enterprise SSO, fine-grained extensibility) where breadth and maturity outweigh higher per-user cost.

### What it is
A mature identity platform, now owned by Okta, spanning both B2C and B2B use cases. It offers broad protocol and SDK support with Universal Login and a Rules/Actions extensibility model, positioning it as enterprise identity infrastructure, not a lightweight developer tool.

### Pricing & MAU cost (+ the cliff)
Free tier covers 25,000 MAU and notably includes SSO, SCIM and AI features. Paid plans step up sharply: Essentials B2C $35/mo, Essentials B2B $150/mo, Professional B2C $240/mo, Professional B2B $800/mo, jumps that startups describe as a 'growth penalty'.

### Setup speed & pre-built UI
Universal Login gets a basic setup running quickly, but the platform's depth means deeper configuration through Rules/Actions takes more effort than Clerk's drop-in approach. It is framework-agnostic, so it fits most stacks at the cost of more upfront wiring.

### Auth methods & protections
Broad authentication method support backed by adaptive MFA and attack protection at the platform level. Its enterprise-grade security posture and wide protocol/SDK support are core to the product, aimed at organizations with varied identity requirements.

### Enterprise SSO/SAML
Enterprise connections are a core capability: SSO and SCIM are included even in the free 25,000-MAU tier and expand at the Professional plans. Broad protocol support makes enterprise identity central to the product, not an add-on bolted onto a consumer tool.

### Organizations & multi-tenant
B2B plans include organizations for multi-tenant apps, aligning with its enterprise identity focus across B2C and B2B. Multi-tenancy is a plan-gated platform feature, not something you build in your own data layer.

### Lock-in & migration
Standard protocols aid portability. Basic identity data and flows are movable. The friction is that deep customizations built with Actions and Rules are Auth0-specific and would need to be rebuilt on another platform.

### Maturity, trust & support
The most mature option here, owned by Okta, carrying enterprise trust and support. Its long track record and enterprise-grade platform make it the established choice where organizational credibility and support depth matter.

### Where it stands out
Stands out for the breadth of its enterprise identity feature set and protocol support, spanning B2C and B2B with adaptive MFA, attack protection, and SSO/SCIM. It covers the widest range of identity requirements of this group.

### Limitations
Steep tier jumps that startups call a 'growth penalty' (Essentials at $35-$150/mo up to Professional at $240-$800/mo), and it requires more configuration than a drop-in tool like Clerk. Cost escalation and setup effort are the main tradeoffs.

### Choose this if you are…
Ideal for: teams needing a mature, compliance-heavy identity platform with dozens of social and enterprise connections and audit-grade features.

Best when: you need proven SOC2/HIPAA posture, many identity providers, and features like audit-log streaming to Datadog/Splunk and per-org RBAC: the free plan covers 25k MAU (now bundling one enterprise SSO connection and SCIM) across Auth0's public-cloud regions (US, EU, UK, AU, JP, CA), B2C Essentials starts $35/mo for 500 MAU and B2B Essentials $150/mo. Pick it (now Okta-owned) over Clerk/Supabase when enterprise checklists and breadth of connections matter more than DX or price.

Avoid if: you're cost-sensitive and early; pricing climbs steeply past the free tier (go Supabase Auth or Better Auth), or your one real need is selling SSO to enterprise buyers, where WorkOS's per-connection model fits better.


## Supabase Auth
*https://supabase.com/auth*

### Built for
Built for: teams already on Supabase Postgres wanting authentication tied directly to their database with row-level security, in a JS/TS-friendly workflow.

Best fit: when you're inside the Supabase stack and want auth, RLS, and data living in one project, not adding a separate identity vendor.

### What it is
Authentication built into the Supabase Postgres platform (GoTrue at its core), integrated with row-level security so authorization rules live in the same database as your data. It ships inside Supabase, never as a standalone product, and is used through Supabase's SDKs.

### Pricing & MAU cost (+ the cliff)
Free tier covers 50,000 MAU. The $25/mo Pro plan includes 100,000 MAU, then $0.00325/MAU beyond, so 100K MAU is covered by the $25 Pro base and 150K runs about $187/mo. That per-user rate makes it the cheapest at scale of this group. 100K users cost roughly $1,000/mo on Clerk, a gap driven by the per-user rate.

### Setup speed & pre-built UI
Straightforward to enable if you are already on Supabase, but it ships with less pre-built UI than Clerk. You build more of the interface yourself. You get tighter integration with Postgres and RLS in return for more front-end work.

### Auth methods & protections
Supports passwords, social and passwordless sign-in, integrated with Postgres row-level security so authorization is enforced in the database. Security is tied to the RLS model, not a separate policy layer, keeping auth and data rules in one place.

### Enterprise SSO/SAML
Available but not the platform's enterprise-SSO strength, which lies in Postgres and RLS integration, not in enterprise connectors. Teams needing SAML/SCIM as a primary requirement fall outside its main design focus.

### Organizations & multi-tenant
Multi-tenancy is modeled in your own Postgres schema and enforced with row-level security. There is no built-in organizations feature. You design the tenant structure yourself, consistent with its database-centric approach.

### Lock-in & migration
Users live in your own Supabase Postgres database, which keeps the data close to you, though the auth itself remains tied to Supabase. Portability of the underlying user records is better than a fully external store, but you are still bound to the Supabase platform.

### Maturity, trust & support
Backed by Supabase's funding and a large community, giving it established institutional and ecosystem support. Trust here derives from the broader Supabase platform, not from a standalone auth track record.

### Where it stands out
The cheapest integrated auth at scale for Supabase users. 100K MAU is included in the $25/mo Pro plan ($0.00325/MAU only above 100K), versus roughly $1,000/mo on Clerk, while keeping users in your own Postgres with RLS integration. Cost and database integration are its distinguishing points.

### Limitations
Ships with less pre-built UI than Clerk, so you build more of the interface yourself, and it is most valuable only if you are already on Supabase. Outside that platform, the integration advantages that justify it largely disappear.

### Choose this if you are…
Ideal for: teams that want authorization enforced in the database itself: users stored as Postgres rows governed by row-level-security policies, with auth bundled at no separate cost.

Best when: you want auth integrated with RLS policies so authorization lives in the database: free covers 50k MAU (bundled into the same $0/$25 Supabase plan), no separate vendor or bill. Choose it over Clerk/Auth0 when you value one integrated stack and data ownership over prebuilt UI, and over Better Auth when you want it hosted and maintained, not self-run.

Avoid if: you're not on Supabase (the integration is the whole point), need polished prebuilt auth components and org management (Clerk), or require enterprise SAML/SCIM connections sold per-customer (WorkOS).


## WorkOS
*https://workos.com*

### Built for
Built for: B2B SaaS companies moving upmarket whose engineers need enterprise features (SSO/SAML, SCIM directory sync, audit logs) bolted onto an existing auth setup.

Best fit: when your app already has login and you now need SAML and SCIM to close enterprise deals, versus replacing your whole auth stack.

### What it is
An enterprise-readiness platform combining AuthKit for core authentication with per-connection SSO/SAML and Directory Sync (SCIM). The design separates everyday auth from the enterprise connectors, which are provisioned and billed one connection at a time instead of by user volume.

### Pricing & MAU cost (+ the cliff)
AuthKit is free up to 1,000,000 MAU, an outlier among these tools. Enterprise SSO is not priced per MAU but per connection: $125 each for the first 15 connections. Cost scales with the number of enterprise customers connected instead of with total user volume.

### Setup speed & pre-built UI
AuthKit provides a hosted UI, and the platform is oriented toward standing up enterprise SSO quickly for B2B teams. Setup centers on provisioning per-connection SSO/SCIM, not assembling consumer auth flows from scratch.

### Auth methods & protections
Core authentication runs through AuthKit, extended by enterprise SSO/SAML and SCIM directory sync provisioned per connection. The emphasis is the enterprise connectors that larger B2B buyers require, not a broad consumer method set.

### Enterprise SSO/SAML
The specialist here: SSO is $125 per connection for the first 15, tiering down to $50 at 101-200 connections, and SCIM follows the same ladder. A connection needing both SSO and SCIM is billed twice at the entry tier ($125 + $125).

### Organizations & multi-tenant
Organization-centric by design, oriented around B2B SaaS where each customer is an organization with its own SSO/SCIM connections. The org model matches its per-connection enterprise-readiness focus.

### Lock-in & migration
Standards-based on SAML and SCIM, which aids portability, with the enterprise side billed per connection. Reliance on open standards keeps migration friction lower than proprietary flows would, consistent with its connection-based model.

### Maturity, trust & support
An established B2B-focused vendor trusted for enterprise readiness, with a product built around the SSO/SCIM needs of enterprise buyers. Its reputation is tied to serving that B2B enterprise-connection use case.

### Where it stands out
Pairs a free auth tier up to 1,000,000 MAU with specialist enterprise SSO and SCIM priced per connection. The combination of a high free auth ceiling and dedicated enterprise connectors is what sets it apart for B2B teams.

### Limitations
Enterprise SSO and SCIM are billed separately per connection ($125 each at the entry tier, and a connection needing both is billed twice), so costs add up as the number of enterprise customers grows instead of staying flat.

### Choose this if you are…
Ideal for: B2B SaaS founders who need to close enterprise deals gated on SAML SSO and SCIM directory sync.

Best when: a big customer says they need SSO with Okta/Entra and SCIM provisioning and you must ship it fast: AuthKit is free up to 1M MAU for core auth, and enterprise SSO uses per-connection volume tiers ($125/connection at 1-15, sliding to $50 at 101-200), with Directory Sync a separate identically-priced SKU. Choose it over Auth0 when SSO/SCIM is the specific unlock, and over Clerk when enterprise connection management is your core.

Avoid if: you're building consumer B2C auth (Clerk/Supabase are far cheaper), or you'll have many tiny enterprise customers. The per-connection pricing (doubled if you need SCIM too) becomes brutal.


## Better Auth
*https://www.better-auth.com*

### Built for
Built for: TypeScript developers who want a framework-agnostic, open-source, self-hosted auth library with full ownership of code and user data.

Best fit: teams that want auth living in their own database and codebase with no per-MAU billing, versus a hosted identity service.

### What it is
An open-source, self-hosted authentication library that is framework-agnostic and TypeScript-native, running inside your own application and database instead of a separate hosted identity server. It is a distinct project from Lucia (the older library that was sunset in 2025, with its maintainer redirecting users toward Better Auth), not a rename of it. Your app and database own the runtime behavior, with functionality extended through plugins.

### Pricing & MAU cost (+ the cliff)
Free and open source, with commercial use allowed and no per-MAU fee at any volume. The cost is operational, not licensed (your own hosting, database and ongoing maintenance), so spend tracks infrastructure and engineering time instead of user count.

### Setup speed & pre-built UI
More setup than the hosted options. You wire the library into your own app and database and own the runtime, since it runs inside your application, not as a separate identity server. The payoff is full code control. The cost is more integration work upfront.

### Auth methods & protections
Authentication methods come from an open plugin ecosystem configured inside your own app. Because it is a self-hosted library, method coverage depends on the plugins added, and the wiring into application and database is yours.

### Enterprise SSO/SAML
SSO/SAML is available through plugins that you implement and host yourself, consistent with its self-hosted library model. There is no managed enterprise-connection service. The capability exists but the integration and operation are your responsibility.

### Organizations & multi-tenant
Organization and multi-tenant support comes via plugins configured in your own app. As a self-hosted library, the tenancy model is something you add and run yourself, not a hosted platform feature.

### Lock-in & migration
No vendor lock-in. Users sit in your own database and the library runs inside your application. Because there is no hosted store to leave, migration is a matter of your own infrastructure, with no provider to extract data from.

### Maturity, trust & support
A fast-growing open-source project, not a hosted vendor, so support comes from the community and its ecosystem. You carry operational responsibility for security updates and hosting, which shifts the trust question onto your own team.

### Where it stands out
Full control with zero per-user fees: an open-source, self-hosted library that keeps users in your own database and charges nothing per MAU. Ownership of the runtime and the absence of metered pricing are its defining traits.

### Limitations
You own hosting, security updates, and maintenance, since it runs inside your own app and database, and as a fast-growing open-source project it is less proven at very high scale than the established hosted vendors. Operational burden is the core tradeoff.

### Choose this if you are…
Ideal for: TypeScript teams who want to fully own their auth, storing users in their own DB with no per-MAU fees or vendor lock-in.

Best when: you want a framework-agnostic, open-source, TypeScript-native auth library you self-host: free forever, users in your own database, plugins for MFA/passkeys/orgs, and no billing that scales with success. Choose it over hosted Clerk/Auth0/Stytch when data ownership and zero marginal cost matter, and over Lucia/Auth.js when you want a batteries-included modern library over lower-level primitives.

Avoid if: you don't want to own security patching, session hardening, and breach risk (hosted Clerk/Supabase remove that burden), or you need turnkey enterprise SSO/SCIM connections out of the box (WorkOS).


## Stytch
*https://stytch.com*

### Built for
Built for: developers building passwordless and fraud-resistant flows who want APIs for magic links, passkeys, OTP, and device fingerprinting over prebuilt UI.

Best fit: when auth is a core product surface needing embedded, API-first passwordless and bot/fraud protection, versus drop-in component kits.

### What it is
A developer-focused authentication and fraud-prevention platform: APIs and SDKs for passwordless (magic links, OTP, passkeys), OAuth, passwords, sessions, RBAC, and B2B org auth, with device fingerprinting for fraud built in.

### Pricing & MAU cost (+ the cliff)
Free up to 10,000 MAU (both B2C and B2B), then ~$0.05/MAU with volume discounts and no hard caps. The cliff: SSO/SCIM connections are $125 each beyond the 5 free, and per-MAU cost compounds at consumer scale.

### Setup speed & pre-built UI
Fast for developers via clean SDKs plus pre-built (and headless) UI components. Docs are strong and integration is quick, though the drop-in UI is less turnkey/polished than Clerk's out-of-the-box components.

### Auth methods & protections
Broad: magic links, email/SMS/WhatsApp OTP, passkeys/WebAuthn, passwords, OAuth, TOTP, and M2M tokens. Standout protection is built-in device fingerprinting/fraud (10k fingerprints free, then $0.005 each).

### Enterprise SSO/SAML
Yes: SAML and OIDC SSO plus SCIM directory sync in the B2B product. Five connections are included free, then $125 per additional connection. Genuinely enterprise-ready for B2B SaaS deals.

### Organizations & multi-tenant
Strong: unlimited Organizations in the B2B product with per-org settings, RBAC, JIT provisioning, and multi-tenant session handling. Built specifically for B2B SaaS multi-tenancy from the ground up.

### Lock-in & migration
Moderate. Standards-based OAuth/SAML/OIDC aid portability, but sessions, user records, and the fraud layer are Stytch-specific. Migration APIs/support exist. The per-MAU model can pressure economics once large enterprise contracts land.

### Maturity, trust & support
Well-funded independent company (founded 2020) with strong docs, SOC 2 / ISO / GDPR compliance, a 99.99% enterprise uptime SLA, and growing adoption. Younger than Auth0 but mature and actively shipping.

### Where it stands out
The auth + fraud combo: passwordless-native login plus built-in device fingerprinting and bot protection in one API, paired with a 10k-MAU free tier and usage-based pay-as-you-go pricing.

### Limitations
Per-MAU pricing gets expensive at consumer scale and can misalign once big enterprise contracts sign. Drop-in UI is less polished than Clerk, and it has fewer legacy turnkey integrations/extensions than Auth0's older ecosystem.

### Choose this if you are…
Ideal for: teams wanting API-first, headless passwordless and biometric flows plus built-in fraud and device-fingerprinting.

Best when: you're building custom auth UX around passwordless magic links, OTP, passkeys, or WebAuthn and want fraud/device intelligence via API instead of prebuilt screens. Free covers 10k MAU (plus 5 SSO/SCIM connections), then roughly $0.05/MAU. Choose it over Clerk when you want a headless API you fully control and fraud prevention baked in, and over Auth0 for a more modern developer-focused API.

Avoid if: you want prebuilt drop-in UI components and to avoid building auth screens (Clerk), you're optimizing purely for lowest cost (Better Auth/Supabase Auth), or you need enterprise SSO reselling (WorkOS).


## Self-managed

### Built for
Skip the auth SaaS: wire authentication yourself with a library (Lucia, Auth.js/NextAuth, SuperTokens self-host, Passport) against your own DB. You own the sessions, tokens, and user table, and every edge case.

### What it is
A code-level auth layer. A library handles hashing, sessions/JWTs, and OAuth flows while you store users in your Postgres/MySQL. No hosted service. Auth logic lives in your app and runs on your infra.

### Pricing & MAU cost (+ the cliff)
No per-MAU pricing and no cliff, which is the exact reason to DIY. You pay only compute/DB you already run. Escapes the brutal auth-SaaS jump where free tiers end and MAU billing balloons. Cost is engineering time, mostly one-time.

### Setup speed & pre-built UI
Slower and mostly UI-less. Libraries give primitives, but polished login screens are on you. Forms, reset flows and verification emails are yours to build. SuperTokens ships some pre-built UI. Most others leave the UX entirely to you.

### Auth methods & protections
Email/password and OAuth (Google/GitHub) come easy. Magic links, TOTP/2FA, rate-limiting, CSRF, and secure cookies are on you to add correctly. The library helps, but protection depth equals your security diligence.

### Enterprise SSO/SAML
The weak spot. SAML/OIDC enterprise SSO is complex and mostly unsupported out-of-box (SuperTokens/self-host has some). Rolling your own SAML is a security minefield. If you need enterprise SSO soon, DIY is the wrong call.

### Organizations & multi-tenant
No built-in orgs, roles, or invitations. You design the tenant schema, membership, and RBAC in your own tables. Doable but real work, but the SaaS rivals hand you this, whereas here every multi-tenant feature is custom.

### Lock-in & migration
Zero vendor lock-in. Users and password hashes sit in your DB, portable anywhere. The flip side is you own migrations, hash-scheme upgrades, and breaking-change maintenance on the library yourself.

### Maturity, trust & support
Libraries are mature and widely used, but auth is security-critical and DIY means no audits, no compliance certs, no support line. A subtle session or token bug is a breach. Trust rests entirely on your implementation.

### Where it stands out
Kills MAU billing, keeps user data in your DB, and bends to any custom flow. Cheapest and most flexible for MVPs and cost-sensitive products where you control the stack and don't need enterprise features day one.

### Limitations
Security burden is heavy and unforgiving. One mistake leaks accounts. No enterprise SSO, orgs, or compliance out-of-box, but UI and edge cases (email deliverability, account recovery) are all yours. Breaks down as security/enterprise needs rise.

### Choose this if you are…
Ideal for: founders who want maximum control and no lock-in: SuperTokens self-hosted, Auth.js for Next, or Lucia primitives to learn the internals.

Best when: compliance demands fully self-hosted identity, or you're deliberately learning auth deeply. All are free/open-source, keep users entirely in your infrastructure, and impose no per-MAU tax. Pick SuperTokens when you want a self-hostable full solution, Auth.js when you just need session handling glued into Next.

Avoid if: you're pre-seed; auth is exactly where a subtle bug leaks every user's account, and hosted Clerk or Supabase Auth remove that risk for free at your scale; roll-your-own only when self-hosting is a hard requirement, not a preference.

