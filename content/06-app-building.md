# 06 — App Building

> Edit any text below. Leave the `##` and `###` headings alone —
> they tell the build where each piece belongs.

## Lovable
*https://lovable.dev*

### Built for
Built for: Non-technical founders and product people prototyping full-stack web apps through natural-language prompts, generating React front ends with backend integration.

Best fit: When you want to describe an app and get a working, editable codebase fast, over hand-coding or a purely visual no-code builder.

### What it is
An AI builder that turns natural-language prompts into a full-stack web app, pairing a React/Tailwind front end with a bundled backend via Lovable Cloud (Supabase-style). You edit by chat, all code stays visible, and Stripe plus GitHub export (paid) are wired in, a prompt-to-product path for web MVPs, internal tools and landing pages.

### What it generates for you
A working React/Tailwind web app plus a bundled Lovable Cloud (Supabase-style) backend, with Stripe integration available. All code is visible and editable by chat, and per Lovable's own terms 'you own your code' and any AI output. GitHub export is unlocked on paid plans.

### Code ownership & exit ramp
Per Lovable's own terms you own the generated code and any AI output. It's standard React and exportable to GitHub on paid plans. The limit is Lovable Cloud. Because it also hosts your backend/database, leaving means re-homing that backend, so the front end is portable but the bundled stack creates soft lock-in.

### Speed to working prototype
Minutes to a working web prototype from a single prompt. The no-code entry means you can go from description to a running React/Tailwind app on the free tier (5 daily build credits) without any setup beyond a browser and account.

### Technical skill needed (to build and fix)
Low to build: the prompt-first, no-code entry gets a non-technical founder to a running app. Fixing is where skill matters. All code is visible and edits happen by chat or in GitHub, so some coding and GitHub comfort helps when the generated React or the Lovable Cloud backend needs correcting.

### Pricing & credit burn
Free tier: 5 daily build credits (up to 30/mo). Paid Pro $25/mo and Business $50/mo, each including 100 monthly credits (Pro ~$21/mo billed annually). Each chat message costs ~0.5 credits (simple) up to ~1.5 (complex), so cost scales directly with how much you iterate; heavy back-and-forth burns the allotment fast.

### Web vs native mobile
Responsive web apps only, with no native mobile build. Output targets the browser (React/Tailwind). If you need a true iOS/Android app this isn't the tool, but it's web-first by design.

### The ceiling
Good for web MVPs, internal tools and landing pages; because all code is visible and exportable to GitHub (paid), complex or custom logic can eventually be hand-coded in the exported React repo, though doing so means working around the Lovable Cloud backend it bundles.

### Where it stands out
A bundled Lovable Cloud backend plus Stripe and a clear 'you own your code' stance make it a common default for shipping a full web MVP without stitching backend services together. You describe the app, get visible React you own, and export to GitHub on paid plans.

### Limitations
Soft lock-in via Lovable Cloud, which hosts the bundled backend even though the React front end is exportable. Credit burn that scales with iteration (~0.5-1.5 credits per message), but web only, with no native mobile. Generated apps also still need your own security review for AI-code risks.

### Choose this if you are…
Ideal for: non-technical and semi-technical founders shipping a polished full-stack web MVP fast

Best when: you want to describe an app in chat and get a React + Supabase full-stack product with auth, database, and clean UI, plus GitHub sync and Supabase integration for when you outgrow the prompt box. Free gives 5 daily/30 monthly credits, Pro $25/mo (100 credits), Business $50/mo. Pick Lovable over Bolt when you want a guided, design-polished full-stack result with tighter backend integration, and over v0 which is frontend-only

Avoid if: you need native mobile apps (FlutterFlow), pixel-level no-code control (Bubble), or you're a strong engineer who'd move faster hand-coding (Self-managed), and watch credit burn on heavy debugging iteration.


## Bolt.new
*https://bolt.new*

### Built for
Built for: Developers and technical tinkerers who want AI to scaffold and run full-stack apps in an in-browser environment with live preview and deploy.

Best fit: When you want prompt-driven generation you can immediately edit and ship in-browser, not a managed no-code platform hiding the code.

### What it is
An in-browser AI builder on StackBlitz WebContainers. It generates and runs full-stack JavaScript apps entirely in the browser: full Node runtime, package manager and build all client-side, with no remote sandbox. Output is standard React/Vite, downloadable, and GitHub auto-sync plus Netlify deploy are built in.

### What it generates for you
Standard React/Vite project code that runs live in-browser via WebContainers and that you can download, modify and host anywhere, with no proprietary format. GitHub auto-sync keeps a repo in step, and you can deploy out to Netlify or other hosts.

### Code ownership & exit ramp
Low lock-in by design. Output is standard React/Vite with no proprietary format, GitHub auto-sync mirrors it to a repo, and you can download and self-host anywhere or deploy to Netlify. Nothing ties the code to Bolt, so the exit ramp is essentially free.

### Speed to working prototype
Immediate: there is no install and no remote sandbox to spin up. The app builds and runs in the browser via WebContainers as soon as you prompt. The free tier ($0, no card) starts instantly within the 1M-token monthly / 300K daily allowance.

### Technical skill needed (to build and fix)
Moderate: it's aimed at developers, and output is standard React/Vite, so familiarity with that stack helps a lot when generations break or need manual fixing. The in-browser runtime lowers setup friction, but debugging still assumes you can read and edit JavaScript.

### Pricing & credit burn
Free $0 with no card (1M tokens/mo, 300K daily cap). Pro $25/mo (10M+ tokens with rollover). Teams $30/member/mo, but Enterprise custom. Billing is token-based and hard to predict (complex apps have reportedly run to $1,000+), and the caps themselves changed twice in early 2026.

### Web vs native mobile
Web apps only, no native mobile. Everything runs and ships as browser-based JavaScript (React/Vite) via WebContainers, so 'mobile' here means a responsive web app, not a native binary.

### The ceiling
Bounded by the in-browser WebContainers runtime and by token budget, which can climb steeply on complex apps. The escape hatch is portability. Download the standard React/Vite code, or push via GitHub auto-sync into a dev environment to go past what the browser build handles.

### Where it stands out
Zero lock-in paired with an instant, install-free in-browser full-stack runtime (WebContainers). The app builds and runs client-side as you prompt, output is standard React/Vite, and GitHub auto-sync plus Netlify deploy export and host anywhere.

### Limitations
Unpredictable token-based billing that has reportedly reached $1,000+ on complex apps, with caps that changed twice in early 2026. Bounded by the in-browser WebContainers runtime. Web only, no native mobile. Generated code still needs review before shipping.

### Choose this if you are…
Ideal for: technical-ish founders wanting in-browser full-stack prototyping with direct control over the code and stack

Best when: you want to generate AND run a full app entirely in the browser (StackBlitz WebContainers), pick your framework, and edit files directly (Free 1M tokens/mo with a 300K daily cap, Pro $25/mo with ~10M tokens, Teams $30/member). Pick Bolt over Lovable when you want raw control over framework choice and file-level editing, not a guided rail, and over v0 when you need full-stack (backend + DB) instead of UI alone

Avoid if: you want maximum design polish and hand-holding (Lovable), native mobile (FlutterFlow), pure UI components (v0), or you'd burn tokens fast on debugging loops; Bolt's token model gets expensive on complex apps.


## Replit
*https://replit.com*

### Built for
Built for: Developers, students, and teams wanting a full cloud IDE with AI agent, hosting, and collaboration across many languages, well beyond web alone.

Best fit: When you need a coding environment plus AI assistance and deployment, not a single-purpose app generator or visual builder.

### What it is
A cloud IDE paired with an AI Agent that builds, runs and deploys full-stack apps in one place, with hosting and deployments built in. The Agent works in billable 'checkpoints', and there is real code access, a built-in database, and one-click deploys (autoscale or reserved VM).

### What it generates for you
App code inside a full cloud IDE with a built-in database and one-click deployments (autoscale, which bills for requests/compute, or a dedicated reserved VM). The AI Agent produces work in discrete checkpoints, each a billable unit, and you keep full code access throughout.

### Code ownership & exit ramp
The code itself is standard and yours to take, but the tie is hosting. The integrated experience (built-in database and one-click autoscale/reserved-VM deploys) lives on Replit. Leaving means moving off that hosting and rewiring deployment elsewhere. Code portable, infra sticky.

### Speed to working prototype
Fast agentic building via the AI Agent, though the full IDE surface adds a little overhead versus a pure prompt box. Each Agent task lands as a checkpoint, and one-click deploys mean you can move from build to hosted quickly once the prototype is running.

### Technical skill needed (to build and fix)
Low-to-moderate: The AI Agent does much of the building, but the full IDE deliberately exposes real code, a database and deploy infra (autoscale vs reserved VM). That surface helps you fix and extend, but it also means more real concepts than a pure prompt builder.

### Pricing & credit burn
Core $20/mo bundles $25 in usage credits, up to 5 collaborators and unlimited workspaces; Pro $100/mo adds teams (up to 15 builders), pooled credits and rollover. Agent billing is effort-based: each completed task is a checkpoint, with simple changes typically under $0.25 and complex ones bundled higher.

### Web vs native mobile
Primarily web apps, APIs and static sites, which is the core of what it builds and hosts. A separate mobile app product exists in Replit's lineup, but the mainstream path here is web, not native mobile.

### The ceiling
A higher ceiling than pure prompt builders because there is a full IDE with real code access, a built-in database and real deploy infra (autoscale or reserved VM). You take on more hands-on work, and going bigger leans on managing that infrastructure yourself.

### Where it stands out
One place to build, run and host (a full IDE, built-in database and one-click deploys) combined with an AI Agent whose effort-based billing keeps small changes typically under $0.25 per checkpoint. Build-plus-host in a single environment is the differentiator.

### Limitations
Effort-based usage billing can be unpredictable as tasks grow (each checkpoint is a billable unit) and the model changed in 2026. You're tied to Replit hosting for the integrated experience. The IDE surface also means more real concepts to manage than a pure prompt builder.

### Choose this if you are…
Ideal for: founders wanting a full cloud IDE plus an AI Agent that can build, run, host, and deploy in one place

Best when: you want Agent 3 to build autonomously WHILE you retain a dev environment (terminal, packages, databases, deployments, collaboration) so you can graduate from prompting to actual coding without leaving; Core $20/mo includes ~$25 usage credits, Agent 3 runs up to 200 min autonomously. Pick Replit over Lovable/Bolt when you want a genuine IDE plus hosting, not just a prompt-to-app rail, and over v0 which is UI-only

Avoid if: you want the slickest no-code full-stack UX (Lovable), native mobile (FlutterFlow), or you're non-technical and the IDE surface overwhelms. The power comes with more complexity than pure prompt builders.


## FlutterFlow
*https://www.flutterflow.io*

### Built for
Built for: Product teams and semi-technical builders creating cross-platform mobile and web apps visually on Flutter, with custom code when needed.

Best fit: When you specifically want native iOS/Android apps from a visual builder with real Flutter export, over web-only generators or heavy hand-coding.

### What it is
A visual builder that generates native Flutter/Dart apps for iOS, Android and web from a single project, combining drag-and-drop visual development with AI generation. It outputs real Dart source with full code export, and connects to Firebase/Supabase, external APIs and GitHub.

### What it generates for you
Clean, real Flutter/Dart source for native iOS, Android and web from one project, generated via visual building plus AI. Code export is available from the Basic plan, so you can download the Dart and continue developing outside the platform, with Firebase/Supabase and API hookups.

### Code ownership & exit ramp
Low lock-in: it exports clean, real Flutter/Dart from the Basic plan, and that native code can be downloaded and developed entirely outside the platform. Because Flutter is a mainstream open framework, you keep full ownership and can continue in any Dart toolchain.

### Speed to working prototype
Slower to a first prototype than prompt-only tools because of the visual-development model (you assemble screens and logic instead of describing them once), but the payoff is a genuine native app for iOS, Android and web, not a web page.

### Technical skill needed (to build and fix)
Moderate: the visual-development model and underlying Flutter/Dart concepts carry a learning curve, steeper than pure prompt builders. To fix or extend meaningfully you work with the exported Dart and integrations like Firebase/Supabase, which rewards some engineering comfort.

### Pricing & credit burn
Basic $39/mo (annual $351/yr), Growth $80/mo for the first seat (annual $720/yr), Business (annual $1,350/yr), with annual billing running about 25% cheaper than monthly. It's a flat subscription instead of per-message credit burn, so cost stays predictable regardless of iteration volume.

### Web vs native mobile
Native iOS and Android plus web from a single Flutter project, the native-mobile pick of this group. It generates real Dart for the app stores (store deploy needs your own Apple/Google developer accounts) instead of just a responsive web page.

### The ceiling
High for mobile. Full Flutter/Dart export means you can extend indefinitely in a mainstream framework outside the platform, wiring in Firebase/Supabase and APIs. The ceiling is set by your Flutter engineering instead of by the builder itself.

### Where it stands out
The only pick here that produces genuine native mobile apps (real iOS/Android and web from one project) while still handing you clean, fully-owned Flutter/Dart you can export from the Basic plan and develop anywhere. Native output plus code ownership is the standout.

### Limitations
A steeper visual-development learning curve than prompt-only tools. Prices rose in 2026 (Basic $30 to $39). Store deployment requires your own Apple and Google developer accounts. Getting full value also assumes comfort with Flutter/Dart to fix and extend the export.

### Choose this if you are…
Ideal for: founders who need real native iOS AND Android mobile apps, beyond web alone

Best when: you want a visual builder that outputs actual Flutter code, with Firebase/Supabase integration, custom functions, and App Store/Play Store deployment, the only tool here purpose-built for cross-platform native mobile; ~$39/mo Basic up through Growth/Business tiers. Pick FlutterFlow over Lovable/Bolt/Replit/v0 which all target web apps and can't ship a native mobile binary, and over Bubble which is web/PWA-only

Avoid if: you're building a web-first SaaS (Lovable, Bolt, Replit), you want pure prompt-to-app with no visual-builder learning curve, or you need complex backend logic better hand-coded; FlutterFlow's strength is the mobile UI layer, and deep logic still means custom code.


## v0
*https://v0.app*

### Built for
Built for: Front-end developers and designers, technical, generating React and Tailwind UI components and pages from prompts within the Vercel ecosystem.

Best fit: When you need polished UI and component code to drop into a Next.js project, not a full backend or standalone no-code app.

### What it is
Vercel's AI builder that generates React/Next.js UIs and apps from prompts, tightly integrated with Vercel hosting and native GitHub (branches and PRs). Output is React/Next.js code, exportable to GitHub, and it inherits Vercel's SOC 2 Type II posture, a front-end-first path into the Vercel stack.

### What it generates for you
React/Next.js UI and application code, synced natively to GitHub with branches and pull requests and deployable straight to Vercel. Code is exportable to GitHub, and the token/credit system that meters generation resets on a monthly cycle.

### Code ownership & exit ramp
Code is exportable via native GitHub (branches and PRs). The source itself is portable. The soft lock-in is deep Vercel coupling (the workflow assumes Vercel hosting and deploys). Moving off means giving up that tight integration even though the React/Next.js code travels with you.

### Speed to working prototype
Fast for front-end and UI generation, especially inside a Next.js/Vercel workflow, and the permanent free tier (~$5 of tokens/mo, roughly 3-8 prompts/day) generates immediately. Deploying to Vercel from the generated code is quick given the native integration.

### Technical skill needed (to build and fix)
Moderate: it's best used by people comfortable with React/Next.js, since both the generated output and the fixes live in that stack. Front-end work is approachable, but getting full value (and debugging) assumes familiarity with Next.js and the GitHub/Vercel flow.

### Pricing & credit burn
Permanent free tier worth ~$5 of tokens/mo (roughly 3-8 prompts/day). Paid plans from $30/mo (Plus; the old $20 Premium tier is closed to new signups). Generation is metered by a token/credit system that resets monthly, and the caps have moved over time, so the effective prompts-per-day there is can shift between periods.

### Web vs native mobile
Web apps only (React/Next.js), with no native mobile. It's a front-end/web builder tied to the Vercel stack. Mobile support means responsive web, with no native app.

### The ceiling
Strong for front-end and Next.js work, its home turf. Full-stack depth leans on the surrounding stack. You extend via the exported React/Next.js code, native GitHub and Vercel deploy instead of an all-in-one backend, so how far it goes depends on that ecosystem.

### Where it stands out
The tightest Next.js/Vercel/GitHub workflow of the group: native GitHub branches and PRs, direct Vercel deploy, a permanent free tier, and Vercel's SOC 2 Type II posture behind it. For a front-end team already on Vercel, the integration is the draw.

### Limitations
Deep Vercel coupling is a soft lock-in even though the React/Next.js code exports to GitHub. The token caps that meter generation move over time. It's also web only (React/Next.js) with no native mobile, a front-end-first tool instead of a full-stack or mobile one.

### Choose this if you are…
Ideal for: founders and developers who already own a backend and just need beautiful frontend UI fast

Best when: you want to generate clean, production-ready React + shadcn/ui + Tailwind components from prompts or screenshots and paste them into an existing Next.js codebase. The cleanest frontend output of this group, Plus $30/user/mo (the old $20 Premium is legacy-only). Pick v0 over Lovable/Bolt/Replit when you specifically want UI scaffolding to drop into your own stack, not a full generated app you must then own, and over Bubble/FlutterFlow which are whole-app platforms

Avoid if: you need a full-stack app with auth/DB/backend (Lovable, Bolt, Replit), native mobile (FlutterFlow), or a no-code database-backed tool (Bubble); v0 hands you the front end and leaves the rest of the product to you.


## Bubble
*https://bubble.io*

### Built for
Built for: Non-technical founders and operators building complex, database-backed web apps visually, without writing code, often for MVPs and internal tools.

Best fit: When you need a mature visual platform with workflows and a database and can invest in learning it, over lighter AI code generators.

### What it is
A visual-programming (no-code) platform for full-stack web apps: drag-and-drop UI, a built-in relational database, and server-side workflow logic, all running on Bubble's managed hosting. Launched in 2012, it is one of the oldest, most established no-code tools.

### What it generates for you
A hosted, running web application: visual pages, a relational database, server-side workflows, and API connectors, all managed inside Bubble. It produces no source code, but your app lives entirely in Bubble's proprietary runtime.

### Code ownership & exit ramp
There is no exportable source code. The app is locked to Bubble's proprietary runtime and hosting. Migrating off means a full rebuild elsewhere. Data is exportable (CSV/API). The UI and logic are not. Weakest exit ramp of the group.

### Speed to working prototype
Fast for data/CRUD apps: a functional MVP in days with no code, far quicker than hand-coding. Slower than AI prompt-to-app tools for a first screen, but much stronger once you need real backend logic and a database.

### Technical skill needed (to build and fix)
No coding required, but a learning curve. You must think in databases, workflows, and conditionals. It's genuine visual programming, not templates. Steeper to master than Softr or Glide, gentler than writing code.

### Pricing & credit burn
Free plan (50k Workload Units, dev-only, no live deploy). Paid web plans (annual): Starter $29, Growth $119, Team $349/mo. Native mobile is a separate track ($42+). Costs meter on Workload Units. Overages ~$0.30 per 1,000 WU. Inefficient apps burn fast.

### Web vs native mobile
Primarily a responsive web-app platform; that's its mature core. Native iOS/Android is now offered via a separate (added-cost) mobile plan track sharing the same backend, but the native product is newer and less proven than the web builder.

### The ceiling
Scales to real production SaaS and marketplaces with paying users, but Workload-Unit costs and performance can strain under high traffic or heavy logic. Not built for compute-intensive apps or anything needing full code-level control.

### Where it stands out
The deepest no-code backend of the bunch: a database, complex multi-step workflows, and a massive plugin and agency ecosystem. Best when a non-coder needs actual application logic, not just a polished front end.

### Limitations
Proprietary lock-in (no code export), a genuine learning curve, and unpredictable Workload-Unit costs at scale. Complex apps can hit performance ceilings, and the native-mobile track still trails the web product in maturity.

### Choose this if you are…
Ideal for: non-technical founders wanting deep no-code control over complex web app logic and data

Best when: you're building a database-driven web app or marketplace with intricate workflows and want a mature visual builder with a huge plugin ecosystem, a managed no-code platform instead of AI-generated code you then maintain. Pricing runs on workload-unit tiers (Starter ~$29/mo up through Growth/Team); pick Bubble over Lovable/Bolt/Replit when you want long-term visual maintainability and marketplace-grade logic without touching code, and over v0/FlutterFlow which are UI-component and mobile-focused

Avoid if: you want AI to write real, portable code you own (Lovable, Bolt), you need native mobile (FlutterFlow), or you expect to scale to heavy custom performance; Bubble's workload pricing and platform lock-in can bite at scale.


## Self-managed

### Built for
Hand-code the product with an AI coding agent (Claude Code, Codex, Cursor) instead of a no-code builder. You own real, portable source from day one. The ceiling is your ability to read and fix what the AI writes. Founders with at least some engineering literacy who want a real, ownable product and custom logic. Wrong tool for a true non-coder. You must be able to review, debug, and deploy what the model generates.

### What it is
You write a production codebase, but an AI agent does most of the typing (scaffolding, features, tests) from your prompts. Not a builder platform. It's you plus a very fast junior engineer in your terminal or IDE.

### What it generates for you
Actual source code in real frameworks (Next.js, React Native, Python), plus config, tests, and migrations. No black-box runtime; everything lands in your repo as files you can read, edit, and deploy anywhere.

### Code ownership & exit ramp
Total and immediate: it's your git repo, no vendor lock-in, no export step. The strongest exit ramp of any option. The "platform" is just tooling. The asset is code you'd have written anyway, only faster.

### Speed to working prototype
Fast for a clickable MVP. Hours to a day for a CRUD app. Slower than no-code for the first screen, but pulls ahead once you need auth, payments, or custom logic that boxed builders can't express.

### Technical skill needed (to build and fix)
Real and non-negotiable. The AI writes 80%, but debugging, architecture calls, and "why is prod down" are yours. Non-engineers hit a wall fast. The tool amplifies skill, it doesn't replace it.

### Pricing & credit burn
A time-vs-money trade, not a flat fee: ~$20-200/mo for the AI plan plus API/token burn that spikes with sloppy prompting. Token efficiency is a learned skill. Vague prompts on a big codebase drain credits fast.

### Web vs native mobile
Both, since it writes any framework. Next.js for web, React Native/Expo or Swift for mobile. But mobile means real build tooling, signing, and app-store review. The AI writes code, not your Apple approval.

### The ceiling
Essentially none on capability. It's real code. It scales as far as your architecture and skill do. The ceiling is human: your ability to review, test, and maintain what an eager AI happily over-generates.

### Where it stands out
High flexibility and ownership at near-no marginal cost per feature. If you can code even a little, it collapses build time while leaving you a real, scalable, portable product, with no platform tax and no walls.

### Limitations
Needs engineering judgment you can't fake; AI writes plausible-but-wrong code and confident security holes, so unreviewed output is a liability. Burns tokens if undisciplined. Not a shortcut for non-technical founders.

### Choose this if you are…
Ideal for: technical founders who can ship code and want zero platform lock-in

Best when: you'd rather pair with an AI coding agent (Claude Code, Codex, Cursor) in a repo (full control over stack, architecture, dependencies, and hosting) than accept a generated-app platform's abstractions. You own portable code from day one and pay only for the AI subscription and your infra; pick DIY over Lovable/Bolt/Replit when you're a capable engineer and long-term maintainability, testing, and custom architecture matter more than first-hour speed

Avoid if: you're non-technical and can't debug generated output (Lovable or Bubble hold your hand), you need a running prototype in an afternoon with no setup (Bolt, Lovable), or you need native mobile with a visual layer (FlutterFlow); DIY trades onboarding speed for control.

