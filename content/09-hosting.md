# 09 — Hosting

> Edit any text below. Leave the `##` and `###` headings alone —
> they tell the build where each piece belongs.

## Vercel
*https://vercel.com*

### Built for
Built for: frontend and full-stack JS/TS teams, especially Next.js users, wanting zero-config Git deploys, preview environments, and edge/serverless functions.

Best fit: Next.js and modern frontend apps where developer experience, per-PR previews, and a global CDN matter more than raw infra control.

### What it is
A front-end/edge cloud (PaaS) optimized for Next.js/React. It serves static sites alongside serverless and edge functions running on Fluid Compute, which bills only during actual code execution instead of while a function sits idle waiting on I/O, the platform's main efficiency lever.

### What it runs
Static sites plus serverless and edge functions on Fluid Compute. The compute layer is framework-optimized around Next.js, and functions are billed only during code execution (not during I/O waits), which is the platform's stated way of cutting wasted function spend.

### Pricing model
Hobby is $0 with hard usage caps. Pro is $20/user/mo, though independent reporting puts typical Pro bills near $67/mo once real usage is included, but Enterprise starts around $3,500+/mo. Fluid Compute bills only during code execution, not during I/O waits.

### Bill-spike risk / hidden costs
The highest here. There are no automatic spend limits by default (you must configure spend management manually), and bandwidth past the 1TB allowance costs $0.15/GB. Documented cases include a $23,000 bill after a DDoS and $700-$1,100 charges from ordinary traffic spikes.

### Cold starts
Largely mitigated on Fluid Compute. Functions are billed during execution and kept responsive instead of paying an idle penalty. The classic serverless cold-start hit is not the platform's main concern.

### Free tier (and catches)
Hobby is free but ships hard caps (100GB bandwidth, 1M invocations, 4h Active CPU and 360 GB-hr memory per month), and hitting any one cap stops the project serving until the next month, not auto-billing overage. Hobby is also restricted to non-commercial use.

### Deployment ease
Zero-config for Next.js. Connect a Git repo and a push triggers a build and deploy with no pipeline to assemble. The tailored path is strongest inside the Next.js/React lane the platform is optimized around.

### Scaling & global reach
Auto-scales front-end and function workloads across a global edge network, so distribution is handled by the platform, not configured per region. Reach is built into the edge model, not something you provision.

### Migration / exit ramp
A standard Next.js app ports to other hosts. The application itself is not locked in. What does not transfer is the tightest Vercel-specific optimizations, so a moved app can lose some of the platform-tuned behavior.

### Where it stands out
The strongest host for Next.js/React, pairing zero-config Git deploys with Fluid Compute, which bills only during code execution rather than during I/O waits, cutting the idle-function spend that weighs on conventional serverless billing.

### Limitations
Hobby bans commercial use and carries hard monthly caps that stop the project serving when hit. It also holds the biggest bill-shock risk here: no default spend cap, $0.15/GB over the 1TB allowance, and documented cases like a $23,000 DDoS bill and $700-$1,100 traffic-spike charges.

### Choose this if you are…
Ideal for: frontend and Next.js teams who want zero-config deploys, instant preview URLs per PR, and a polished edge/serverless developer experience.

Best when: you're on Next.js (or a modern frontend) and want git-push deploys, per-PR preview environments, and edge functions with a smooth workflow: Hobby is free, Pro is $20/user/mo including 1TB fast data transfer and 10M edge requests, with overage at $0.15/GB. Choose it over Netlify for first-class Next.js support, and over Render/Railway when you're frontend-not-backend.

Avoid if: you need always-on stateful backends, containers, or databases (serverless-only; go Render/Railway/Fly), or you serve heavy bandwidth where $0.15/GB overages hurt (Cloudflare Pages has free egress).


## Render
*https://render.com*

### Built for
Built for: small-to-mid teams wanting a Heroku-style PaaS for web services, background workers, cron jobs, and managed Postgres without touching Kubernetes.

Best fit: full-stack apps needing long-running services and databases with simple config, versus frontend-first or function-only platforms.

### What it is
A full-stack container PaaS in the Heroku mould, running web services, static sites and managed PostgreSQL/Redis from containers or native runtimes. Pricing is flat per service and paid instances stay warm. It targets steady always-on multi-service stacks, not bursty workloads.

### What it runs
Web services, static sites and managed PostgreSQL and Redis, deployed from containers or native runtimes. The managed-database support alongside long-running web services is what makes it a full-stack host instead of a static or front-end-only one.

### Pricing model
Flat per-service pricing: each paid service carries a fixed cost and stays warm, so the bill is predictable and does not swing with traffic. That trades away usage-based savings for cost certainty, which is the point for steady always-on stacks.

### Bill-spike risk / hidden costs
Low and predictable. Flat per-service pricing means the bill is set by how many services you run, not by traffic, so a usage spike does not translate into a surprise charge the way a metered model can.

### Cold starts
The main free-tier catch. Free web services spin down after 15 minutes of inactivity and then take 30-60 seconds to cold-start on the next request. Paid instances stay warm and avoid this entirely. The spin-down is specific to the free tier.

### Free tier (and catches)
A genuine full-stack free tier requiring no card: static sites, web services with 750 instance-hours/month, and a free Postgres. The limits are that free web services cold-start after spinning down and the free Postgres expires 30 days after creation (with a 14-day grace period to upgrade).

### Deployment ease
Very easy Git-based deploys with automatic runtime detection, so a standard app builds and ships without much configuration. It runs from containers or native runtimes, keeping the setup step light for common full-stack stacks.

### Scaling & global reach
Auto-scales services and offers deployment across multiple regions. Scaling is handled at the service level on always-on instances, fitting steady multi-service stacks better than bursty scale-to-zero patterns.

### Migration / exit ramp
Low lock-in. Services run as standard containers or native runtimes, so moving to another host is mainly a matter of redeploying the same artifacts elsewhere instead of unwinding platform-specific code.

### Where it stands out
The most complete free tier of the group (static sites, 750 web-service instance-hours/month and a free Postgres with no card), combined with flat per-service pricing and warm, always-on paid instances that give a predictable bill.

### Limitations
The free tier's web services spin down after 15 minutes idle and take 30-60 seconds to cold-start, and the free Postgres expires 30 days after creation. Avoiding both means moving to paid, warm instances. The free tier is genuine but time- and latency-limited.

### Choose this if you are…
Ideal for: full-stack founders who want a simple PaaS with fixed, predictable per-service pricing and a permanent free tier.

Best when: you want web services, managed Postgres, cron jobs, and background workers with pricing you can predict and no surprise metering. It's the only one of Render/Railway/Fly with a permanent free tier (512MB, sleeps with cold starts, no card), and Starter is $7/mo always-on. Choose it over Railway when you prefer fixed per-service costs and a free tier, and over Fly when you want managed simplicity over raw containers.

Avoid if: you want cheapest metered pay-per-second for low-traffic apps (Railway often runs $10-15 vs Render's $21-34 for web+DB+worker), or you're frontend-only (Vercel/Cloudflare).


## Railway
*https://railway.com*

### Built for
Built for: indie developers and early startups wanting the fastest path from repo to running services and databases, with usage-based pricing and a clean dashboard.

Best fit: quick full-stack deploys and prototypes where you want containers, databases, and env vars managed together with minimal setup.

### What it is
A modern full-stack container PaaS built on usage-based pricing with scale-to-zero. It runs any container plus managed databases and meters consumption per resource. Idle services stop billing, an economic model that suits bursty or low-traffic workloads over flat always-on ones.

### What it runs
Any container, plus managed databases, deployed from Git or Docker. Consumption is metered per resource with scale-to-zero. Services can idle down to no compute cost, the model Railway leans on instead of flat per-service plans.

### Pricing model
Usage-based. A permanent Free plan exists at $0/mo with $1 of monthly usage credits, alongside a one-time $5 trial credit (30 days, no card). The entry paid plan is Hobby at $5/mo with $5 of monthly credits, and Pro is $20/mo per workspace with $20 included. Consumption beyond the included credits is billed as used.

### Bill-spike risk / hidden costs
Usage-based. The bill scales directly with consumption and a busy period costs more. Scale-to-zero caps idle spend by stopping services with no traffic, but there is no flat ceiling, so cost tracks how much compute you actually draw.

### Cold starts
A consequence of scale-to-zero: a service that has idled down cold-starts on its next request. Keeping a service always-on avoids the delay but forgoes the idle-cost savings, but the choice is between cost and first-request latency.

### Free tier (and catches)
A permanent Free plan exists: $0/mo with $1 of monthly usage credits, plus a separate one-time $5 trial credit (30 days, no card required). The ongoing entry paid plan is Hobby at $5/mo with its $5 monthly credit allowance.

### Deployment ease
Among the best modern developer experience in this group. Deploy from Git or Docker in minutes. The workflow is built around getting a container running with minimal setup, which is central to Railway's positioning.

### Scaling & global reach
Scales compute up and down, including to zero when idle, within a regional footprint. The strength is elastic, consumption-following compute, not the broad multi-region distribution some peers emphasize.

### Migration / exit ramp
Low lock-in. Workloads are standard containers. The app is portable and migrating away is largely redeploying the same container image on another host without proprietary rework.

### Where it stands out
The strongest modern developer experience for container deploys, paired with usage-based, scale-to-zero economics. Services idle down to no compute cost and you pay for consumption, which favors bursty and low-traffic workloads.

### Limitations
The Free plan's $1 of monthly credits is tiny. Real workloads land on the $5/mo Hobby plan quickly. Being usage-based, bills scale with consumption, so there is no flat ceiling on a busy month.

### Choose this if you are…
Ideal for: solo devs and small teams wanting a slick PaaS that meters per-second so low-traffic backends stay cheap.

Best when: you run a web service plus database plus worker at modest traffic and want to pay only for what actually runs. There's only a tiny free tier ($1 of monthly usage credits, plus a one-time $5 trial credit) before the $5/mo Hobby plan, but per-second billing means a full backend often lands around $10-15/mo versus Render's $21-34. Choose it over Render when metered pricing beats fixed and you love the deploy DX/monorepo support.

Avoid if: you need a meaningful free tier (Render), you're hosting a static frontend (Cloudflare Pages/Vercel), or you want globally-distributed containers with persistent volumes (Fly.io).


## Cloudflare Pages
*https://pages.cloudflare.com*

### Built for
Built for: developers deploying static sites and edge apps who want tight pairing with Workers on Cloudflare's global network, in a JS/TS-friendly workflow.

Best fit: JAMstack and edge-first apps that lean on Workers, KV, R2, and D1 at the edge, versus origin-based serverless hosts.

### What it is
Cloudflare's edge platform, pairing static-site hosting with edge compute via Workers (backed by R2 object storage and KV). It runs on Cloudflare's global edge network and is distinguished less by features than by an unusually generous free tier: unlimited sites and unlimited bandwidth.

### What it runs
Static assets plus edge compute via Workers, with R2 object storage and KV available for state. Compute runs within the edge runtime, not as long-lived containers, which shapes both what it can run and how portable that code is.

### Pricing model
Free static hosting with unlimited sites, unlimited bandwidth and 500 builds/month, carrying no commercial-use restriction. Beyond the free allowances, Workers edge compute is metered. The paid layer sits on compute; bandwidth and static hosting stay free.

### Bill-spike risk / hidden costs
Low. Bandwidth is unlimited with no egress fees on the free tier, so the usual source of hosting bill-shock (traffic-driven data-transfer charges) does not apply. Metered cost only appears if you push Workers compute past its free allowances.

### Cold starts
Effectively none for static assets, which are served straight from the edge. Workers run on an always-warm edge runtime instead of spinning up per request. The edge-compute path avoids the cold-start penalty seen on scale-to-zero container hosts.

### Free tier (and catches)
The most generous static free tier here: unlimited sites, unlimited bandwidth and 500 builds/month, with no commercial-use restriction. The main boundary is on compute (Workers usage is metered once past its free allowances), not on hosting or bandwidth.

### Deployment ease
Easy for static and Jamstack projects. Connect a Git repo and deploys run against the edge. The straightforward path applies to static builds; adding Workers edge compute brings the edge runtime's own constraints into the setup.

### Scaling & global reach
The strongest global reach in this group, served from Cloudflare's global edge network. Static assets and Workers run from that edge footprint, which is the platform's core distribution advantage over container-based hosts.

### Migration / exit ramp
Static sites and standard code are portable and move easily. The exception is Workers-specific code written for the edge runtime, which is less portable and would need rework to run on a conventional host.

### Where it stands out
The cheapest global static hosting here (unlimited sites and unlimited bandwidth with no egress fees and no commercial-use restriction), served from Cloudflare's global edge, so traffic-driven bandwidth bills essentially do not apply.

### Limitations
The edge model constrains compute. Workloads run within the Workers edge runtime rather than as full long-lived containers, and Workers-specific code is less portable to a conventional host, the price of the platform's cheap, wide edge reach.

### Choose this if you are…
Ideal for: teams shipping static sites, SPAs, or JAMstack frontends plus edge Workers who never want to pay egress.

Best when: you're serving a high-traffic static site or SPA and want unlimited free bandwidth and requests at any scale, with Workers for edge logic. The free tier is uniquely uncapped on bandwidth (500 builds/mo), so a viral frontend costs nothing in egress. Choose it over Vercel/Netlify precisely when bandwidth is your cost risk, and over Fly/Render when you're frontend-plus-edge, not running servers.

Avoid if: you need long-running stateful backends, containers, or a traditional Node server with persistent processes (go Fly.io or Render), or deep Next.js SSR features (Vercel).


## Fly.io
*https://fly.io*

### Built for
Built for: engineers who want to run full Docker containers and VMs close to users in multiple regions, comfortable managing more infrastructure themselves.

Best fit: latency-sensitive or stateful apps needing multi-region containers and persistent volumes, versus higher-level PaaS abstractions that hide the machine.

### What it is
An infrastructure-leaning PaaS that runs Docker containers as micro-VMs (called Machines) placed close to users across regions. Billing is per second per running machine with no seat fee, so cost tracks actual machine runtime, not a fixed monthly plan.

### What it runs
Any Docker container, run as a micro-VM (a Machine), plus managed Fly Postgres. Because the unit is a standard container under full region control, it runs largely whatever you can package in Docker, not a fixed set of supported runtimes.

### Pricing model
Pure usage-based with no seat fee. Each running machine is billed per second. A minimal always-on machine (shared-cpu-1x, 256MB) runs about $1.94/mo, while typical production usage lands around $13-20/mo. Cost scales with how much machine time you actually run.

### Bill-spike risk / hidden costs
Per-second billing means cost rises with load and running-machine count, and there is no spend cap by default. Because there is no fixed ceiling, a heavier workload (more machines or more runtime) adds up directly against the per-second rate.

### Cold starts
You control the tradeoff per machine. Keep a machine warm for instant response, or let it auto-stop to save cost and accept a start-up delay on the next request. The behavior is a per-machine configuration choice, not a platform default.

### Free tier (and catches)
No free tier for new users. New accounts get a $5 one-time trial credit, after which a card is required to continue. Unlike Render, there is no ongoing free option. The trial is a short evaluation window, not a standing plan.

### Deployment ease
The most involved of this group. You define machines and regions explicitly via a fly.toml configuration instead of getting a zero-config Git flow, which is the cost of the per-region, per-machine control the platform offers.

### Scaling & global reach
Purpose-built for global, multi-region deployment. You place machines per region and run compute close to users. Reach is explicit and under your control. You decide the regions instead of relying on an automatic edge network.

### Migration / exit ramp
Low app lock-in. The deployed unit is a standard Docker container, but the application moves to any container host. What is Fly-specific is the machine and region orchestration, not the app itself.

### Where it stands out
The finest-grained global control in this group. Docker containers run as micro-VMs placed per region and billed per second with no seat fee, so you tune exactly where compute runs and pay only for the machine time used.

### Limitations
No free tier (only a $5 one-time trial credit before a card is required), and it has the steepest setup here, defining machines and regions via fly.toml. Per-second billing has no default cap. Cost adds up under sustained load.

### Choose this if you are…
Ideal for: teams wanting Docker containers running close to users across many regions, with persistent volumes and pure pay-as-you-go.

Best when: you need real containers deployed to multiple global regions with persistent storage (even a database or stateful service), billed per-second with no base plan fee (a shared-cpu-1x/256MB runs ~$2/mo at 24/7. No free tier, just a short trial). Choose it over Render/Railway when multi-region latency and full Docker control matter, and over Cloudflare when you need stateful servers not just edge functions.

Avoid if: you want managed hand-holding and a free tier (Render), a static frontend (Cloudflare/Vercel), or you'd rather not think about regions and volumes at all (Railway).


## Netlify
*https://www.netlify.com*

### Built for
Built for: frontend teams and agencies building JAMstack sites who want Git-based deploys, deploy previews, and serverless functions with minimal config.

Best fit: static and hybrid marketing or content sites where build pipeline and CDN simplicity lead, versus app-platform hosts running long-lived servers.

### What it is
A frontend/Jamstack cloud that literally coined the term 'Jamstack.' Framework-agnostic (unlike Vercel's Next.js focus): Git-based deploys to a global CDN with serverless, edge, background (up to 15 min) and scheduled functions, plus Netlify Blobs storage. Batteries-included: built-in forms, identity/auth, and A/B split-testing that replace separate tools. No traditional backend or provisioned database.

### What it runs
Static sites + serverless functions + edge functions + background functions (up to 15 minutes) + scheduled/cron functions + Netlify Blobs (key-value storage). Next.js runs via the @netlify/next adapter. You can build APIs, process background jobs, and handle form submissions, but there's no persistent always-on backend or provisioned relational database.

### Pricing model
Flat + credit-based. Free (300 credits/mo) → Pro $20/mo flat with unlimited seats → Enterprise. Netlify moved to credit-based pricing and, on 2026-04-14, dropped per-seat charges. Pro includes 3,000 credits/month. Surface price is close to Vercel's, but the credit model changes the real cost. Heavy builds and function usage draw down credits, so model your actual usage, not trusting the sticker price.

### Bill-spike risk / hidden costs
Moderate: the credit model can surprise you on heavy build minutes or function usage, but it's generally more predictable than Vercel's bandwidth/invocation overages. The main thing to watch is drawing down the included monthly credit allowance (300 on Free, 3,000 on Pro) faster than expected on frequent deploys or busy functions.

### Cold starts
Slower than Vercel. Serverless cold starts run ~3s+ (versus Vercel's ~1s), edge function cold starts ~28ms (vs ~12ms), and ~90ms average TTFB (vs ~70ms). It also has 16+ edge locations versus Vercel's 100+, so distant users can feel slightly more latency. Fine for static/Jamstack; noticeable for SSR-heavy apps.

### Free tier (and catches)
Free tier: 300 credits/month, custom domains, and HTTPS. Crucially, it allows commercial use, unlike Vercel's Hobby tier. Everything draws from the same credit pool (bandwidth at 20 credits/GB, so ~15GB if spent entirely on bandwidth), which can throttle teams that deploy frequently or run busy functions.

### Deployment ease
Excellent and framework-agnostic: Git-based deploys, preview URLs, a mature plugin ecosystem, and vercel.json-equivalent config via netlify.toml. Its built-in forms, identity/auth, and split-testing remove entire categories of extra setup. The standout for Astro/Hugo/SvelteKit and any multi-framework or static workflow.

### Scaling & global reach
Auto-scales on its CDN across 16+ edge locations, solid but fewer points of presence than Vercel (100+) or Cloudflare (300+), so users far from a POP can feel slightly more latency. Perfectly fine for most static/Jamstack traffic. Less ideal if global edge latency is a hard requirement.

### Migration / exit ramp
Lower lock-in than Vercel. It's framework-agnostic; standard apps move cleanly to another host or self-hosting. You'll hit some friction only if you depend on Netlify-specific features (Blobs storage, identity/auth, split-testing), which have no drop-in equivalent elsewhere.

### Where it stands out
Framework flexibility plus batteries included: the best pick for non-React stacks (Astro, SvelteKit, Hugo), with built-in forms, identity/auth, and A/B split-testing that replace separate paid tools. Its free tier allows commercial use (unlike Vercel), and background functions run up to 15 minutes.

### Limitations
Slower serverless cold starts (~3s) and far fewer edge locations (16+) than Vercel. The credit-based model (300 credits/month on Free) can confuse and throttle heavy users. No persistent backend or provisioned database, and SSR support is clunkier, so the latest Next.js features tend to land on Vercel first.

### Choose this if you are…
Ideal for: JAMstack and static-frontend teams who want a rich build-plugin ecosystem plus built-in forms, identity, and edge functions.

Best when: you're deploying a static site or SPA and value Netlify's mature plugin marketplace, form handling, and add-ons: free covers 300 credits/month (bandwidth draws them down at 20 credits/GB, so ~15GB at most), Pro is $20/mo flat with unlimited seats (Netlify removed per-seat pricing in April 2026). Choose it over Vercel when you're not specifically on Next.js and want the plugin/forms ecosystem, and over Cloudflare when you want those integrated conveniences.

Avoid if: you're on Next.js and want first-class SSR/ISR (Vercel), you serve heavy bandwidth and want free egress (Cloudflare Pages), or you need real always-on backends, containers, or databases (Render/Fly.io).


## Manual DIY

### Built for
Own the metal: rent a VPS (Hetzner/DigitalOcean) and run your app with Docker, Coolify, or Caddy instead of a managed PaaS. You get a cheap, unopinionated server and full root, plus all the sysadmin that implies. Founders and devs comfortable with the terminal who want low, predictable cost and full control. Not built for those who want git-push-and-forget. Here you own uptime, patches, and firewall, not a platform.

### What it is
A raw Linux server you configure end-to-end: OS, runtime, reverse proxy, TLS, and deploys. Coolify/Dokku add a Heroku-like layer on top. Bare Docker+Caddy is even more hands-on. No platform abstracting the box away.

### What it runs
Anything that runs on Linux: any language, long-lived servers, background workers, cron, databases, websockets, with no runtime restrictions or function timeouts. More flexible than serverless PaaS, which constrains what you can run.

### Pricing model
Flat monthly VPS rent (~$4-6/mo entry Hetzner, more for RAM/CPU/disk), not usage-metered. No per-request, bandwidth (within cap), or build-minute billing. Cost is fixed and low. Your TIME is the real spend, mostly upfront.

### Bill-spike risk / hidden costs
Almost none, which is the draw. Flat rent means no surprise autoscale bill. Bandwidth is generous and capped. Hidden cost is your labor and outage risk, plus paying for idle capacity you provisioned but don't use.

### Cold starts
None. The server runs continuously so every request hits a warm process, with no serverless cold-start latency. What it costs you is paying 24/7 whether traffic comes or not, and scaling manually, not to zero.

### Free tier (and catches)
No free tier: you pay from day one (~$4/mo). Cheaper than most PaaS paid plans, but there's no $0 hobby lane. Catch: the low price hides the setup/maintenance time, which is the actual cost of going DIY.

### Deployment ease
Hardest factor. Bare VPS means manual deploys, SSH, and config unless you add Coolify/Dokku for push-to-deploy. Even then it's more work than a managed PaaS. Great once wired, painful to get there and to keep running.

### Scaling & global reach
Manual and single-region by default. You resize the box (vertical) or hand-build load balancers and multi-region (horizontal). No auto-scale, no global edge/CDN unless you assemble it. This is where DIY clearly breaks at scale.

### Migration / exit ramp
Very portable: it's just Docker/Linux, movable to any provider with a container and a DNS change. No proprietary platform to escape. Owning standard tooling is the strongest long-term argument for self-managing.

### Where it stands out
Rock-bottom flat cost, no cold starts, no bill spikes, runs literally anything, zero lock-in. Best value for a founder with ops skill running an MVP or steady-traffic app who wants predictable spend.

### Limitations
You are the ops team. Security patches, backups, monitoring, and 3am outages are yours. No auto-scaling, edge, or managed HA without heavy work, but unpolished unless you invest. Ops load grows with users, which is DIY's ceiling.

### Choose this if you are…
Ideal for: technically confident founders who want a self-hosted Heroku experience with zero platform markup and full control.

Best when: you want to run Coolify (open-source PaaS) or plain Docker Compose on a $5-20/mo Hetzner/DigitalOcean box: git-push deploys, databases, and SSL you fully own, at a fraction of managed pricing for predictable workloads. Choose this over Render/Railway when the cost savings and control justify the effort and you enjoy owning the stack.

Avoid if: you're pre-seed and every hour on uptime, TLS renewal, scaling, and security patching is an hour not spent on product; Render or Railway get you deployed in minutes with the platform owning reliability, which is almost always the right trade early.

