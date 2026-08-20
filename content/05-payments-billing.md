# 05 — Payments & Billing

> Edit any text below. Leave the `##` and `###` headings alone —
> they tell the build where each piece belongs.

## Stripe
*https://stripe.com*

### Built for
Built for: Engineering-led startups through large enterprises with developers who want programmable payments, subscriptions, and financial infrastructure via its APIs.

Best fit: When you have technical resources and need maximum flexibility and global coverage, and are willing to handle sales-tax and merchant-of-record concerns yourself.

### What it is
A developer-first payment processor and API that charges cards directly into your own bank account, with the broadest product suite here: Checkout, Payment Links, Billing, Connect, Tax and Radar. It is NOT a Merchant of Record. You remain the legal seller and own sales-tax/VAT registration and remittance. A separate MoR option, Stripe Managed Payments, entered public preview in Feb 2026.

### Fees / cost (% of revenue)
2.9% + $0.30 per successful US online card, with add-ons that stack: +1.5% international cards, +1% currency conversion, +0.5% manually-entered. Stripe Tax adds 0.5%/txn (or $0.50 via API). Stripe Billing 0.7% of billing volume, or from $620/mo on contract. ACH is 0.8% capped at $5. Instant Payouts 1.5% (50c min). Effective all-in ~3-4%+.

### Merchant of Record (who handles tax)
No: YOU are the Merchant of Record and must register, calculate, collect, file and remit sales tax/VAT in each jurisdiction. Stripe Tax (0.5%/txn no-code, or $0.50/txn via API) calculates and collects but does not file or remit. The newer Stripe Managed Payments is a separate MoR option, in public preview since Feb 2026.

### Pricing models it handles
Flat-rate and per-seat subscriptions plus usage/metered billing, with metering covered up to 100 million events per month, and multi-phase schedules for pricing that changes over the contract term. All of these sit within the single 0.7% billing-volume layer on top of Stripe.

### Needs a separate payment processor?
No separate processor is needed, but that is because Stripe itself is the processor. Billing runs on Stripe's payment rails at roughly 2.9% + $0.30, and using Stripe Billing effectively commits the account to Stripe for money movement.

### Subscription lifecycle
Covers the full lifecycle within Stripe: trials, proration on plan changes, upgrades and downgrades, and multi-phase schedules where pricing shifts across defined periods. Because it is native to Stripe, these lifecycle states are managed through the same API as payments.

### Dunning
Smart Retries and automatic dunning reminders are built in and included within the 0.7% billing fee at no extra charge. Failed-payment recovery does not require a separate tool or add-on. Retry logic and reminders are handled inside the same Stripe Billing layer.

### Invoicing
Native invoicing and quotes are part of the billing layer, both covered within the 0.7% fee alongside recurring and usage charges. Invoices are generated inside Stripe instead of through a separate tool, keeping billing documents in the same system as payments.

### Payment methods & recurring
The widest set here: cards, Apple/Google Pay, ACH, SEPA, Link and 100+ local payment methods. Stripe Billing adds a full native subscription engine with metered/usage-based billing, automatic card retries (Smart Retries), dunning emails and Revenue Recovery, while Radar provides ML fraud scoring.

### Payout speed
Rolling ~2 business days on a standard, configurable schedule for established US accounts. The first payout is delayed ~7-14 days, up to 30 in higher-risk industries or countries. Instant Payouts settle in ~30 minutes for a 1.5% fee (50c minimum) once an account has ~60 days of processing history, in eligible countries.

### Country availability
Business accounts can be created in ~46 countries, while you can charge customers globally in 135+ presentment currencies plus a wide range of local payment methods. That makes it broad for accepting payments worldwide, though the set of countries you can actually operate an account from is narrower than its currency reach.

### Approval & onboarding
Instant and self-serve. You sign up and can accept payments within minutes, with risk review running in the background instead of as an upfront gate. Because that review happens after the fact, accounts can later be restricted or placed under reserve, and several high-risk business categories are restricted outright.

### Holds & shutdowns
Documented pattern of sudden freezes and rolling reserves on flagged or high-risk accounts. Independent reports cite ~10-25% of volume held ~90 days, often triggered by risk flags or sudden sales spikes. Payouts can be paused during a review, and after a closure residual balances are typically held 90-180 days. A restricted-business list applies.

### Chargeback / dispute costs
$15 per dispute, charged even when you submit evidence and win, because as your own Merchant of Record you carry the dispute liability and the operational work of contesting it directly. That cost and time burden grows with volume, and it is a direct consequence of Stripe not acting as the seller of record.

### Setup & engineering effort
The most engineering-heavy option here. You wire up the API/SDK or embed hosted Checkout, and configure your own tax setup, webhooks and subscription logic. The docs and Elements/API are strong, and Payment Links offer a no-code path that can be live in minutes, but a full integration is real build-and-maintain work best handled by a developer.

### Integrations
Native to the Stripe ecosystem and its APIs, so integrations run through Stripe's own platform instead of external connectors. This keeps billing, payments and related Stripe products in one system, but ties the integration surface to Stripe.

### Migration
Tied to Stripe. Billing configuration moves within the Stripe ecosystem but not easily out of it, since the billing layer and processing are the same vendor. Leaving Stripe for payments effectively means rebuilding the billing setup elsewhere.

### Where it stands out
Its standout is breadth: the widest API and product suite, the lowest headline processing rate here, and the deepest third-party integration ecosystem (Shopify, most SaaS billing and accounting tools). Add strong docs, 100+ payment methods and a full native Billing engine, and it is one of the most flexible options in the group.

### Limitations
You own global tax registration, filing and remittance. You carry chargeback liability directly ($15/dispute even if you win), and fees stack once add-ons (int'l +1.5%, Tax, Billing) pile on. There is a documented freeze/rolling-reserve risk on flagged accounts, no storefront out of the box, and full billing/tax must be built and maintained yourself.

### Choose this if you are…
Ideal for: technical founders who want the most flexible, best-documented payments API and will own tax compliance

Best when: you're building custom billing (usage-based, metered, complex subscriptions, or marketplaces via Connect) and want the deepest ecosystem (Stripe Tax, Billing, Radar, Invoicing) at a 2.9% + 30¢ base. Pick Stripe over Paddle/Polar/Lemon Squeezy when you need control and lower base fees and will register/remit sales tax and VAT yourself (or bolt on Stripe Tax)

Avoid if: you sell globally and don't want to become a tax filer in dozens of jurisdictions. A Merchant of Record (Paddle, Polar, Lemon Squeezy) remits tax for you; or you're mobile in-app subscription-led (RevenueCat) or in-person retail (Square).


## Paddle
*https://www.paddle.com*

### Built for
Built for: SaaS and software companies, often small teams without a finance department, who want a merchant of record handling global tax, compliance, and billing.

Best fit: When selling software worldwide and you want VAT/sales-tax and fraud offloaded, accepting less low-level control than a raw payments API gives.

### What it is
A billing platform that operates as Merchant of Record, meaning Paddle becomes the legal seller and the transaction is between the customer and Paddle. In that role it bundles payment processing, subscription billing and global tax handling into one platform instead of leaving them to separate tools.

### Fees / cost (% of revenue)
5% + $0.50 per checkout transaction, all-inclusive of processing and global tax, with no monthly or migration fees. A currency-conversion margin of up to 1.5% applies, so the effective rate climbs toward ~6-7% on international sales, and independent sellers report ~12-13% on small subscriptions. Products under $10 and invoicing need custom pricing, but the fee is NOT refunded when you refund a customer.

### Merchant of Record (who handles tax)
Yes: Paddle is the legal seller of record and registers, files and remits VAT/sales tax across ~200 countries on your behalf. It issues compliant invoices, absorbs the tax liability, and produces one consolidated payout to reconcile, which removes the entire registration-and-filing burden that a non-MoR processor leaves to you.

### Pricing models it handles
Recurring subscriptions and one-time purchases for digital goods, billed and taxed by Paddle as Merchant of Record. Because it acts as the legal seller, global tax calculation and remittance are folded into the same pricing flow, not handled as a separate step.

### Needs a separate payment processor?
No: Paddle is both the payment processor and the Merchant of Record, so it moves the money and acts as legal seller in one platform. There is no external gateway to connect or maintain, at the cost of not choosing your own processor.

### Subscription lifecycle
Subscription lifecycle is managed by Paddle in its role as seller of record. Renewals, changes and cancellations run through the platform that also owns the tax and payment relationship. The customer relationship sits with Paddle instead of the merchant.

### Dunning
Churn recovery is included as part of the Merchant-of-Record service, not billed separately, so failed-payment retries fall under the single 5% + $0.50 checkout fee alongside payments, tax and support.

### Invoicing
Tax-compliant invoices are generated by Paddle as the seller of record. The invoice reflects Paddle as legal seller and carries the tax it collects and remits. Invoicing is therefore tied to the Merchant-of-Record role, but the merchant does not issue it.

### Payment methods & recurring
Cards, PayPal, Apple Pay and wallets, with mature subscription management, a RevenueCat integration for apps, and a developer API/webhooks. Failed-payment recovery and dunning (Retain/ProfitWell), churn analytics and free ProfitWell Metrics are built in, with fraud protection included as MoR. Fewer third-party integrations than Stripe.

### Payout speed
Slow: Paddle creates a payout on the 1st and sends it by the 15th, taking up to 3 working days to arrive, subject to a $100 (£100/€100) minimum and paid by wire transfer or Payoneer. Cadence is account-configurable (some report ~weekly/bi-weekly), but the monthly cycle plus a holding period is the slowest cash access here and strains early cashflow.

### Country availability
Sells to almost 200 countries and prices in 30+ currencies as the MoR, with balances held in USD/EUR/GBP and payouts in 13 currencies. Russia, Belarus, Iran and North Korea are excluded due to sanctions. Seller onboarding is global but gated by a manual approval step, so where you can operate from depends partly on clearing that review.

### Approval & onboarding
Manual underwriting, typically ~2-7 business days, and Paddle can reject new or unusual product types. Reported triggers include an undisclosed ~3 months of prior payment-processing history, conditional/qualified refund-policy language, and a legal-entity name that doesn't match your site. Multiple rejection cycles are commonly reported by indie founders.

### Holds & shutdowns
Documented sudden account closures with terse notices and category reclassifications (e.g. to 'human services'), and its risk team reportedly uses AI and can close accounts after years. As MoR it enforces strict product eligibility and can decline or offboard accounts. Support is reported as slow (2-3 days). The gated, opaque approval is the main structural risk here.

### Chargeback / dispute costs
$15 (£15/€15) per card chargeback and $20 for PayPal, passed to the seller in addition to the original transaction amount. Paddle fights disputes on your behalf as MoR, and both the fee and the original amount are returned if it wins. Fraud and chargeback protection are bundled into the base 5% fee, not billed separately.

### Setup & engineering effort
Low-code via a hosted checkout, so tax and billing infrastructure do not have to be built. The main friction is onboarding. Going live requires manual approval by Paddle before the account can transact, which adds a review step ahead of launch.

### Integrations
A hosted or overlay checkout plus an API and webhooks, so integration centers on embedding Paddle's checkout and reacting to its events. The connection points are oriented around the Merchant-of-Record checkout, without a broad third-party connector library.

### Migration
As Merchant of Record, Paddle owns the customer and payment relationship, so the customers are legally Paddle's. Leaving means re-collecting payment credentials and re-establishing those relationships under a new seller.

### Where it stands out
The 5% + $0.50 fee is all-inclusive, bundling payments, global tax across ~200 countries, fraud, chargeback coverage and support into one rate as Merchant of Record. The distinguishing point is consolidating billing and tax liability under a single legal-seller platform.

### Limitations
At 5% + $0.50 the all-inclusive rate is higher than assembling Stripe Billing plus separate processing. Going live also depends on manual approval, and category-based account closures have been reported, adding review and continuity risk.

### Choose this if you are…
Ideal for: SaaS founders selling globally who never want to think about sales tax or VAT

Best when: you're a B2B/B2C software company wanting a Merchant of Record that becomes the legal seller (handling global tax registration and remittance, fraud, chargebacks, and localized checkout) for a flat 5% + 50¢, no monthly fee. Pick Paddle over Stripe when tax compliance and dunning are worth the higher rate, and over Polar/Lemon Squeezy when you want the most mature, enterprise-trusted MoR with strong subscription tooling

Avoid if: you want the lowest fees and will handle tax (Stripe), you're an indie wanting a cheaper dev-friendly MoR (Polar's paid tiers drop to 3.4%), or you sell mobile in-app (RevenueCat) or in person (Square).


## Polar
*https://polar.sh*

### Built for
Built for: Indie developers and open-source maintainers, highly technical and small, monetizing digital products, subscriptions, and usage with a developer-first merchant of record.

Best fit: When you're a solo dev or tiny team wanting modern DX and MoR tax handling, over a heavier enterprise billing platform.

### What it is
An open-source, developer-first billing platform that acts as Merchant of Record, taking on the legal-seller role for tax purposes. Alongside standard subscriptions it supports usage-based and credit-style pricing models, and its billing runs on Stripe payment rails underneath.

### Fees / cost (% of revenue)
Starter free at 5% + $0.50; Pro $20/mo at 3.8% + 40c; Growth $100/mo at 3.6% + 35c; Scale $400/mo at 3.4% + 30c ($240-$4,800/yr for paid tiers). Add +1.5% on international (non-US) cards and $15/dispute. Stripe payout fees pass through at cost. Orgs created before 2026-05-27 keep a grandfathered 4% + 40c Early Member rate (+0.5% subs) until they upgrade.

### Merchant of Record (who handles tax)
Yes: Polar is the legal seller of record and remits VAT/sales tax across 60+ jurisdictions, running on underlying Stripe, PCI-DSS-Level-1 infrastructure. As MoR it also handles dispute and fraud prevention. Coverage is solid and growing but, as a younger platform, has a shorter track record than Paddle's, and Stripe's holds and reviews apply underneath.

### Pricing models it handles
Subscriptions alongside usage-based billing and credit-style models, so pricing can be charged by consumption or against prepaid credits, not just on a fixed recurring plan. This range beyond basic subscriptions is Polar's stated focus.

### Needs a separate payment processor?
No: Polar acts as the Merchant of Record, so it takes the legal-seller role instead of requiring a separate gateway. Payments run on Stripe rails underneath, but that is arranged through Polar, not a processor you connect yourself.

### Subscription lifecycle
Subscriptions with upgrades and downgrades plus usage tracking. Consumption is metered over the billing period alongside standard plan changes. Lifecycle events run through Polar as the Merchant of Record, with the underlying payments settled on Stripe rails.

### Dunning
Automated dunning for failed payments is provided. Retries on declined charges are handled by the platform instead of requiring the merchant to build recovery logic. It runs as part of the Merchant-of-Record service.

### Invoicing
Invoices are generated by Polar in its Merchant-of-Record role. The document reflects Polar as the legal seller, not produced by the merchant directly. Invoicing is bundled into the same seller-of-record service that handles tax and payments on Stripe rails.

### Payment methods & recurring
Card payments only, via Stripe, with subscriptions, one-time purchases and strong usage-based/metered billing, a strength for developer and AI tools billed by consumption. It also offers license keys, benefits, a customer portal and webhook events, though it carries lighter enterprise-contract tooling than Paddle.

### Payout speed
A 7-day settlement delay applies by default to organizations created on or after 2026-05-12; organizations created before that keep instant payouts. Withdrawals are initiated manually via Stripe Connect Express, and Stripe's payout fees pass through at cost. User reports flag payout delays (funds not received after ~25 days) and occasionally blocked payouts.

### Country availability
Sells globally as MoR, with seller onboarding relying on Stripe-supported regions. Official docs list 160+ payout countries via Stripe Connect Express. Cuba, Russia, Iran, North Korea and Syria are excluded. Card payments run via Stripe, and the integration set is developer-oriented (SDKs, API, webhooks), not broad local-method coverage.

### Approval & onboarding
Self-serve onboarding with KYC handled via Stripe, and developer-friendly by design. API-first with SDKs, so an engineer can wire up a working integration fast. There is no heavy manual approval gate. The main expectation is developer comfort, since it offers less no-code hand-holding than Lemon Squeezy or Gumroad.

### Holds & shutdowns
As MoR, dispute and fraud handling shift to Polar, but it is a smaller platform with a shorter dispute-handling track record, and Stripe's underlying holds and reviews still apply. User reports describe payout delays (~25 days), blocked payouts, sudden account closures with poor communication, checkout outages, and support that can take a week.

### Chargeback / dispute costs
$15 per dispute, flat, on every plan. As an MoR built on Stripe, Polar handles the dispute and fraud-prevention process on your behalf. The operational side is largely off you, though the per-dispute fee still applies. The exact chargeback fee passed through from Stripe is not separately published by Polar.

### Setup & engineering effort
Fast for developers via its API, aimed at technical founders integrating through REST endpoints and webhooks. It assumes comfort with code instead of offering a no-code path, but for that audience the integration is quick.

### Integrations
A REST API and webhooks, with an open-source codebase. Integration is code-first through documented endpoints and event callbacks. The open-source foundation means the implementation itself can be inspected and extended.

### Migration
The Merchant-of-Record relationship means migrating off re-onboards customers to a new seller, since Polar was the legal seller of record. The payment relationship does not transfer cleanly. Customers effectively have to be re-established elsewhere.

### Where it stands out
Open-source and developer-first as a Merchant of Record, with support for usage-based and credit-style models beyond flat subscriptions. The combination of an open codebase, seller-of-record tax handling and consumption pricing is what separates it from the others here.

### Limitations
As the youngest Merchant of Record in this set it carries more payout and support maturity risk than longer-established platforms. Its payments run on Stripe rails and are limited to card payments. The track record and rail breadth are what you give up.

### Choose this if you are…
Ideal for: indie hackers and developers wanting a modern, open-source Merchant of Record with the best DX

Best when: you're selling digital products, SaaS, or usage-based software and want MoR tax handling plus a clean API, and volume justifies its rate-reducing tiers (5% + 50¢ free, dropping to 3.8% on Pro $20/mo, 3.6% on Growth, 3.4% on Scale), cheaper than flat-5% Paddle/Lemon Squeezy at scale. Pick Polar over Lemon Squeezy for lower effective fees and open-source transparency, and over Stripe when you want tax remitted for you

Avoid if: you need enterprise procurement trust and maturity (Paddle), you're a raw dev wanting Stripe's full flexibility and lower base rate, or you're mobile-IAP (RevenueCat) or in-person (Square).


## Lemon Squeezy
*https://www.lemonsqueezy.com*

### Built for
Built for: Solo founders and small teams selling digital products, SaaS, and licenses who want an all-in-one merchant of record with minimal setup.

Best fit: When you want fast, low-code global selling with tax handled, and don't need deep API customization or enterprise-scale billing logic.

### What it is
An all-in-one Merchant of Record for digital products and SaaS, pairing MoR tax handling with a hosted storefront, checkout overlays, subscriptions, software license keys, discounts and affiliates. Popular with indie hackers, it runs on Stripe-grade infrastructure and the 13-person team was acquired by Stripe in July 2024. It is now being folded into Stripe Managed Payments, in public preview since Feb 2026.

### Fees / cost (% of revenue)
5% + $0.50 base, with no monthly fee and no paid tier. Surcharges stack: +1.5% international cards, +1.5% PayPal, +0.5% on subscriptions, 5% on recovered carts and 3% on affiliate sales, plus a 1% international payout fee. Independent estimates put the real effective rate anywhere from 5.5% to 11% depending on geography, methods and features used.

### Merchant of Record (who handles tax)
Yes: Lemon Squeezy is the legal seller of record and takes on global VAT/sales-tax collection and remittance, processing refunds and producing a single consolidated payout. It runs on Stripe-grade, PCI-DSS-Level-1 infrastructure and lists AI fraud protection, so the same core compliance burden a non-MoR processor leaves to you is handled here.

### Pricing models it handles
One-time, subscriptions, usage-based billing (new), license keys and discounts/affiliates, all as Merchant of Record.

### Needs a separate payment processor?
No: Lemon Squeezy is itself the processor and Merchant of Record (cards, PayPal, wallets). You integrate only LS.

### Subscription lifecycle
Subscriptions with a customer portal and failed-payment recovery, managed via hosted checkout as MoR.

### Dunning
Built-in failed-payment recovery/dunning to reduce involuntary churn.

### Invoicing
Issues receipts and tax-compliant invoices per order as Merchant of Record.

### Payment methods & recurring
Up to 21 payment methods including PayPal, with subscriptions, newer usage-based billing, a customer portal, failed-payment recovery/dunning and fraud prevention. Automated software license-key issuance is a standout for selling code. Subscription depth is narrower than Stripe's, and the toolset is aimed at simple digital-product billing instead of enterprise contracts.

### Payout speed
Roughly a 13-day hold on net sales, with payouts processed twice monthly on the 1st and 15th and funds arriving around the 14th and 28th (then 1-5 days to reach the bank). Payouts are free to US banks and cost 1% to international banks, faster than Paddle's monthly cycle but slower and fee-bearing compared with a direct processor.

### Country availability
Sells globally as the Merchant of Record and pays out across a broad set of geographies: bank transfer to ~79 countries and PayPal to 200+ countries/regions, roughly 279+ in total. Seller signup is self-serve with KYC and quick to go live, making it practical for indie founders in most places to start selling internationally.

### Approval & onboarding
Self-serve signup with KYC and no manual approval gate, so it is relatively quick to go live. This low-friction onboarding, combined with MoR tax handling out of the box, is a core reason indie hackers reach for it. You can set up a hosted checkout and start charging without clearing a review.

### Holds & shutdowns
As MoR it absorbs chargeback risk but can hold or review accounts. Day-to-day holds are less reported than Paddle, yet transition risk is high. Support has reportedly slowed since the Stripe acquisition (users cite waits of 'weeks'), and in May 2026 a support agent accidentally mass-cancelled one customer's (Screen Studio) subscriptions. Community sentiment has cooled.

### Chargeback / dispute costs
A $15 dispute fee that is not returned whether or not the dispute is contested. As the Merchant of Record, Lemon Squeezy manages disputes directly with the card networks. The fraud/chargeback liability is largely off you, but the flat per-dispute fee still lands on your account when a chargeback occurs.

### Setup & engineering effort
Among the easiest here. A hosted checkout, storefront and checkout overlays need no backend code, with an API and webhooks for deeper builds. You can embed a link or button and be live quickly. The whole flow is designed so a developer (or a non-technical seller) can start selling a digital product with minimal setup.

### Integrations
Cards, PayPal and wallets. API and webhooks. No-code storefront. Integrations narrower than Stripe.

### Migration
Central risk: users are being migrated toward Stripe Managed Payments. Some features won't carry over and new development has slowed, but effectively a forced migration.

### Where it stands out
The simplest all-in-one MoR for indie software sellers: a hosted storefront, license-key delivery, discounts and an affiliate system, all no-code and on Stripe-grade infrastructure, with global tax handled. For a solo founder who wants to ship and start charging quickly without assembling billing, storefront and compliance separately, it is the fastest on-ramp.

### Limitations
Stacked surcharges push the effective rate to 5.5%-11%, and payouts carry a ~13-day hold plus a 1% international fee. The bigger risk is strategic: acquired by Stripe and now being folded into Stripe Managed Payments (3.5% on top of standard Stripe processing, ~6.4% + $0.30 all-in on a domestic US card), with some features (affiliates, storefront, downloads) reportedly not carrying over, slowed development, and no firm sunset date.

### Choose this if you are…
Ideal for: solo makers and creators selling digital downloads, courses, licenses, and simple SaaS

Best when: you want the fastest no-code path to a global storefront with MoR tax handling, license keys, and built-in affiliate and email tools: 5% + 50¢ plus surcharges (1.5% international cards, 1.5% PayPal, 0.5% subscriptions). Now Stripe-owned so it's a polished, stable pick. Choose Lemon Squeezy over Polar when you want the more turnkey storefront and affiliate features out of the box, and over Stripe when you want tax off your plate

Avoid if: your volume is high enough that Polar's tiered 3.4-3.8% beats LS's flat-plus-surcharges, you need deep custom billing (Stripe), or you're mobile-IAP (RevenueCat) or brick-and-mortar (Square).


## RevenueCat
*https://www.revenuecat.com*

### Built for
Built for: Mobile app developers and product teams, technical, running iOS/Android subscriptions who need cross-platform in-app purchase infrastructure and subscription analytics.

Best fit: When your revenue is app-store IAP and you need to manage entitlements and metrics across platforms, not general web card payments.

### What it is
In-app subscription management for mobile apps that wraps the App Store and Play Store billing systems without replacing them. It layers purchase SDKs, subscription analytics and paywall tooling over native store billing, so the stores still process payment while RevenueCat manages entitlement state and reporting.

### Fees / cost (% of revenue)
Free up to $10,000/month MTR on the Basic plan, or up to $2,500 MTR on Pro, after which Pro charges 1% of MTR. Because the App Store and Play Store process the payments, this fee is charged on the tracked revenue that flows through that store billing.

### Merchant of Record (who handles tax)
Apple/Google are the Merchant of Record for in-app purchases and handle store-region tax, but RevenueCat wraps App Store/Play billing and is not the seller of record.

### Pricing models it handles
Mobile in-app subscriptions and one-time purchases, transacted through the App Store and Play Store, plus Web Billing (via Stripe) for selling subscriptions on the web. Store purchases stay bounded by what the underlying store billing supports, with RevenueCat managing the entitlements on top.

### Needs a separate payment processor?
No separate processor is used. RevenueCat wraps the App Store and Play Store billing systems, which handle the actual charge. The stores act as the payment mechanism, so there is no external gateway but also no way around store billing.

### Subscription lifecycle
Lifecycle is driven by the underlying stores. Renewals, grace periods and related states originate in App Store and Play Store billing, and RevenueCat surfaces that store-driven state consistently across both platforms; it does not control the billing cycle itself.

### Dunning
Recovery is largely handled by the underlying app stores' billing retry logic, not by RevenueCat, since the stores process the payment. Failed-charge handling therefore depends on App Store and Play Store retry behavior, not a dunning system the merchant configures.

### Invoicing
Transactions produce store receipts through the App Store and Play Store, not traditional B2B invoices. Since the stores are the seller to the end user, RevenueCat reports on those receipts instead of issuing merchant invoices of its own.

### Payment methods & recurring
Recurring runs through App Store/Play in-app purchases (end-user methods = whatever the stores accept, incl. Apple/Google Pay). RevenueCat manages subscription state, entitlements and paywalls on top.

### Payout speed
RevenueCat never touches funds; Apple and Google pay out on their own schedules (typically monthly, with a lag).

### Country availability
Available wherever the App Store and Google Play operate, but the RevenueCat SDK is global.

### Approval & onboarding
Needs Apple Developer and/or Google Play accounts (and their review); RevenueCat itself is self-serve SDK setup.

### Holds & shutdowns
Funds and account standing sit with Apple/Google, not RevenueCat. Store account suspension is the risk to watch.

### Chargeback / dispute costs
Refunds/disputes are handled by Apple/Google under store policy; no separate RevenueCat dispute fee.

### Setup & engineering effort
Setup is a mobile SDK integration on iOS and Android, wiring the app to the stores' billing through RevenueCat's SDKs. The effort is concentrated in the mobile client, not a server-side billing build, but it requires native app integration.

### Integrations
iOS and Android SDKs for the client, plus analytics and attribution integrations; subscription data can flow into product and marketing tooling. The integration surface centers on mobile clients and the App Store/Play Store billing it wraps.

### Migration
Mobile-store subscription state complicates moving off, because active subscriptions and entitlements live in the App Store and Play Store systems that RevenueCat wraps. Migrating means carrying that store-held subscription state to another setup.

### Where it stands out
It is oriented specifically to mobile in-app subscriptions across both the App Store and Play Store, wrapping store billing with SDKs, analytics and paywall tooling. The distinguishing point is unifying store subscription state and paywalls across the two platforms.

### Limitations
It wraps App Store and Play Store billing, plus newer Web Billing via Stripe. It is no longer strictly mobile-only. On the Pro plan the fee is 1% of MTR beyond the free threshold, so cost scales with tracked revenue once past $2,500 MTR.

### Choose this if you are…
Ideal for: mobile app founders monetizing via App Store and Google Play in-app subscriptions

Best when: you ship iOS/Android and need to manage subscriptions, entitlements, receipt validation, paywalls, and cross-platform subscriber analytics without building StoreKit/Billing plumbing (free up to $2,500 monthly tracked revenue, then 1% of MTR). Pick RevenueCat over Stripe/Paddle/Polar/Lemon Squeezy because none of those touch Apple/Google's native IAP rails at all. The stores are your processor and RevenueCat sits on top

Avoid if: you sell web/desktop SaaS or digital goods (use Stripe or an MoR), you process payments outside the app stores, or you're pre-revenue and want to avoid another SDK, though the free tier makes early adoption low-risk.


## Square
*https://squareup.com*

### Built for
Built for: Brick-and-mortar retailers, restaurants, and service businesses, non-technical owners, needing point-of-sale hardware plus integrated online payments.

Best fit: When you sell in person and want POS, inventory, and payments bundled, instead of a developer-first API for a software product.

### What it is
A full payments + commerce platform (processor, POS app, hardware, invoices, online store) from Block. You accept card, tap, and online payments on one Square account and dashboard, no separate acquirer.

### Fees / cost (% of revenue)
In-person 2.6% + 15c (2.4% + 15c on Premium $149/mo). Online 3.3% + 30c on Free, 2.9% + 30c on Plus $49/mo. Manually keyed 3.5% + 15c. No monthly fee on the Free plan.

### Merchant of Record (who handles tax)
No: Square is a payment processor, not a Merchant of Record. You are the seller of record and remain responsible for calculating, collecting, and remitting your own sales tax and VAT.

### Pricing models it handles
One-time, in-person, invoices, and recurring via the Subscriptions API (weekly/monthly/yearly cadences, trials, discount phases). No native usage-based metering. You meter externally and bill through the API.

### Needs a separate payment processor?
No. Square is the processor and acquirer. It settles funds directly to your bank. It replaces both the gateway and the merchant account in a single stack.

### Subscription lifecycle
Subscriptions API creates plans, plan variations, and per-customer subscriptions. Supports trials, discount phases, pauses, and cancellation. Card-on-file customers are auto-charged, but others get an emailed invoice with a pay link.

### Dunning
Basic retries and automatic reminder emails on failed or unpaid invoices/subscriptions. No advanced smart-retry or configurable dunning schedules like Stripe Billing. You build escalation logic yourself.

### Invoicing
Yes: native Square Invoices, free to create. You pay standard processing only when paid. Supports one-off, recurring, milestone, and estimate-to-invoice, with card-on-file, tips, and payment links.

### Payment methods & recurring
Cards, Apple Pay, Google Pay, tap-to-pay, Cash App Pay, gift cards, and Afterpay (BNPL). Recurring via card-on-file + Subscriptions API. No native ACH for standard checkout the way some rivals offer.

### Payout speed
Free next-business-day deposits (payments before 5pm PT arrive next business day). Instant or same-day transfers cost 1.95% per transfer, 24/7, with a $25 minimum balance after fees.

### Country availability
Payments available in 8 markets: US, Canada, UK, Ireland, Australia, Japan, France, and Spain. Narrower global reach than Stripe or Adyen, mostly single-country selling per account.

### Approval & onboarding
Instant: aggregator model, sign up and take payments in minutes with no separate underwriting wait. In exchange there is risk-based review that can trigger later holds once volume grows.

### Holds & shutdowns
A real risk. Square can freeze funds 90-180 days or deactivate accounts algorithmically, often with limited appeal, especially on sudden volume spikes or high-risk categories. Reserves can be debited without prior notice.

### Chargeback / dispute costs
No per-dispute fee (vs Stripe's $15), but you only lose the disputed amount if you lose. Eligible sellers get free Chargeback Protection covering up to $250/month in qualifying disputes.

### Setup & engineering effort
Low for point-and-click (POS, invoices, hosted online store, no code). Moderate for custom builds via Web Payments SDK and REST APIs, well-documented but less deep than Stripe's developer tooling.

### Integrations
Large App Marketplace plus WooCommerce, BigCommerce, Wix, QuickBooks, and payroll/HR tools. Native Square Online store and hardware. Fewer third-party dev libraries and plugins than Stripe's ecosystem.

### Migration
Card-on-file and customer data can be migrated in via Square's import and Customers/Cards APIs. Moving hardware and POS workflows is heavier. PAN migration requires a compliant transfer request between processors.

### Where it stands out
Unified in-person + online: one free POS, first-party hardware, one ledger, instant onboarding, no chargeback fee. Stripe has no comparable card-present + POS + hardware stack.

### Limitations
Only 8 countries. Higher online rates than Stripe on the free plan. Weaker dunning and no usage-based billing. Account-freeze/hold risk. Thinner developer tooling for complex custom platforms.

### Choose this if you are…
Ideal for: founders with a physical retail, hospitality, or in-person services component alongside online sales

Best when: you take in-person card payments and want a free POS app, hardware, and unified online+offline inventory (2.6% + 15¢ tapped/dipped in person, ~2.9% + 30¢ online, free POS software). Pick Square over Stripe when the card-present counter/on-the-go experience and integrated POS/hardware matter, and over Paddle/Polar/Lemon Squeezy which are digital-only and can't process a physical swipe

Avoid if: you're pure SaaS/digital with no in-person sales (Stripe for flexibility, an MoR for global tax), you sell internationally and need tax remittance (Paddle/Polar), or you're mobile-IAP (RevenueCat); Square's developer API is thinner than Stripe's.


## Manual DIY

### Built for
Go direct to Stripe's API and write your own billing brain, with no Paddle/Chargebee abstraction. Maximum control and lowest fees, but you inherit every edge case, including sales tax, that a MoR would have absorbed. Technical teams with a backend and someone who understands billing edge cases. Great for a lean MVP charging a few plans; dangerous once tax jurisdictions, proration, and dunning pile up.

### What it is
Stripe (or similar processor) as raw rails plus your own code for subscriptions, invoicing, and tax. You're assembling a billing system, not buying one. Your engineers replace the SaaS layer.

### Fees / cost (% of revenue)
Just the processor's cut: ~2.9% + $0.30 per charge on Stripe, no MoR markup (Paddle/LemonSqueezy add ~2-3% on top). You save that spread, and spend it back in engineering time and tax tooling.

### Merchant of Record (who handles tax)
You are the merchant. No one shields you. You register, collect, and remit sales tax/VAT yourself. Stripe Tax calculates rates but does NOT file. This is the single biggest hidden cost of going DIY.

### Pricing models it handles
Anything you're willing to code: flat, tiered, per-seat, usage/metered, one-time. Stripe Billing primitives cover most. Exotic hybrid models mean custom logic. Flexibility is unlimited, effort scales with weirdness.

### Needs a separate payment processor?
No: Stripe IS the processor. That's the whole model. You talk to it directly instead of through a reseller. You do need to add tax, analytics, and email layers yourself.

### Subscription lifecycle
Stripe Billing handles renewals, upgrades, proration, and cancels via API/webhooks, but you must wire and test every webhook. Miss one and a canceled user keeps access, or a card update silently fails.

### Dunning
Stripe's Smart Retries and email reminders exist but must be enabled and configured. Deeper recovery flows you build. Weaker out-of-the-box than dedicated dunning tools. Involuntary churn creeps up if you ignore it.

### Invoicing
Stripe Invoicing generates hosted invoices and PDFs natively, solid for most. Custom branding, consolidated invoices, or region-specific compliance formats are on you to configure or template.

### Payment methods & recurring
Cards, ACH, SEPA, wallets, and 40+ local methods via Stripe, recurring is first-class. You enable and test each method. Every added method is more UI states and failure paths you own.

### Payout speed
Stripe's schedule: ~2 business days in the US after the initial ~7-day rolling hold, faster/instant options for a fee. No MoR sitting on your money, but no MoR advancing it either. You carry refund risk.

### Country availability
Stripe operates in ~46 countries for accepting. You can sell globally but must handle each region's tax/compliance yourself. A MoR would cover global sales for you. DIY means you gate or lawyer-up per market.

### Approval & onboarding
You open your own Stripe account, fast for standard businesses, minutes to live. Higher-risk verticals face review or rejection with no reseller to hide under. Your legal entity is exposed directly to the processor.

### Holds & shutdowns
Risk is fully yours. Stripe can freeze funds or offboard you for spikes, disputes, or policy hits, and you have no MoR buffer. Mitigate by staying low-risk and diversifying, but you're one flag from a frozen balance.

### Chargeback / dispute costs
You eat them directly, at ~$15 per dispute plus the lost amount, and assemble the evidence yourself. Stripe Radar helps but needs tuning. No MoR to absorb fraud, so chargebacks hit your revenue and your account health.

### Setup & engineering effort
The real price. Days to a basic checkout, weeks-to-months for full-featured subscriptions, tax, dunning, and webhook reliability. This one-time build only pays off versus a MoR's % fee at meaningful, sustained volume.

### Integrations
Stripe has the deepest ecosystem and SDKs of any processor. You can connect to almost anything, but you write the glue. Accounting, tax filing, and analytics tools integrate, yet wiring and maintaining them is your job.

### Migration
Onboarding is easy. Leaving is the hard part. You own the customer/card data (PCI scope) and Stripe helps export tokens to another processor. Migrating off your own custom billing logic later is a full re-engineering project.

### Where it stands out
Lowest fees, total control, and no ceiling on custom logic. If billing is a core competency or your margins are thin, owning the Stripe integration beats renting a MoR, as long as you can staff the tax and edge cases.

### Limitations
You become the tax authority, the fraud team, and the compliance department. Slower to launch, risky if under-built, and legal exposure is direct. For global consumer sales a MoR is usually worth its cut over pure DIY.

### Choose this if you are…
Ideal for: engineering-led teams with unusual billing needs and appetite to own the stack

Best when: your pricing is truly non-standard (bespoke metering, custom proration, complex entitlements) and off-the-shelf Billing/MoR products can't model it, so you build on raw Stripe primitives (PaymentIntents, webhooks, your own subscription state machine) for maximum control and lowest fees (2.9% + 30¢). Pick DIY over Stripe Billing/Paddle only when the logic doesn't fit their abstractions

Avoid if: you'd be reimplementing dunning, invoicing, tax, and proration that Stripe Billing or an MoR already solve; you become liable for global sales tax/VAT yourself, plus PCI scope, webhook reliability, and refund edge cases; most founders should start managed and drop to raw APIs only where forced.

