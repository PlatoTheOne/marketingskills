# Multi-Project Marketing Skills Integration Templates

This playbook is built for using this repository as a reusable skills library across many projects.

## 1) Recommended Operating Model (For Multiple Projects)

Use a hub-and-spoke setup:

- Hub: keep this repo as your central "marketing skills source of truth"
- Spokes: each product repo has its own `.agents/product-marketing-context.md`
- Shared skills: each project links or copies from this repo's `skills/`

Reason:

- Skills are reusable method + workflow
- Product context is project-specific and must not be shared across products

---

## 2) Common Setup Template (Paste In Every Project)

### 2.1 Create the `.agents` folder

```powershell
New-Item -ItemType Directory -Path .agents -Force | Out-Null
New-Item -ItemType Directory -Path .agents\skills -Force | Out-Null
```

### 2.2 Install skills from your fork (recommended)

```bash
npx skills add PlatoTheOne/marketingskills --skill `
  product-marketing-context `
  marketing-ideas `
  copywriting `
  page-cro `
  analytics-tracking
```

If you prefer local copy from this cloned repo:

```powershell
Copy-Item -Recurse -Force "G:\Marketing Hacker\skills\*" ".agents\skills\"
```

### 2.3 Create project-specific context file

Create `.agents/product-marketing-context.md` using this starter:

```markdown
# Product Marketing Context

*Last updated: YYYY-MM-DD*

## Product Overview
**One-liner:** [What is this product in one sentence?]
**What it does:** [2-3 sentences]
**Product category:** [How users search for this]
**Product type:** [SaaS / e-commerce / service / marketplace]
**Business model:** [Subscription / one-time / retainer / hybrid]

## Target Audience
**Target companies/customers:** [ICP]
**Decision-makers/buyers:** [roles]
**Primary use case:** [main job to be done]
**Jobs to be done:**
- [...]
- [...]

## Problems & Pain Points
**Core problem:** [...]
**Why alternatives fall short:** [...]
**What it costs them:** [...]
**Emotional tension:** [...]

## Competitive Landscape
**Direct competitors:** [...]
**Secondary competitors:** [...]
**Indirect alternatives:** [...]

## Differentiation
**Key differentiators:**
- [...]
- [...]
**Why customers choose us:** [...]

## Objections
| Objection | Response |
|-----------|----------|
| [...] | [...] |

## Customer Language
**How they describe the problem (verbatim):**
- "[...]"
- "[...]"
**Words to use:** [...]
**Words to avoid:** [...]

## Brand Voice
**Tone:** [...]
**Style:** [...]
**Personality:** [3-5 adjectives]

## Proof Points
**Metrics:** [...]
**Customers/logos:** [...]
**Testimonials:** [...]

## Goals
**Business goal:** [...]
**Primary conversion action:** [...]
**Current metrics:** [...]
```

### 2.4 Global kickoff prompt (works for all project types)

Paste this to your agent:

```text
Read .agents/product-marketing-context.md first.
Then propose a 30-day marketing plan for this project with:
1) quick wins in 7 days
2) compounding plays in 30 days
3) required tracking events
4) weekly KPI targets.
Use the skills: marketing-ideas, copywriting, page-cro, analytics-tracking.
```

---

## 3) SaaS Template

### 3.1 SaaS skill set

```bash
npx skills add PlatoTheOne/marketingskills --skill `
  product-marketing-context `
  pricing-strategy `
  signup-flow-cro `
  onboarding-cro `
  page-cro `
  seo-audit `
  ai-seo `
  programmatic-seo `
  email-sequence `
  paid-ads `
  analytics-tracking `
  churn-prevention `
  referral-program
```

### 3.2 SaaS day-1 prompts

```text
Read .agents/product-marketing-context.md and build:
1) ICP-to-channel map
2) offer strategy (free trial vs demo vs freemium)
3) 90-day growth plan with weekly priorities.
```

```text
Audit our signup and onboarding funnel.
Output:
- top 5 drop-off hypotheses
- instrumentation gaps
- 3 A/B tests with expected lift and success metrics.
Use signup-flow-cro, onboarding-cro, analytics-tracking, ab-test-setup.
```

```text
Design our pricing and packaging review plan:
- value metric recommendation
- tier strategy
- pricing page test backlog
- risk-controlled rollout plan.
Use pricing-strategy, page-cro, paywall-upgrade-cro.
```

### 3.3 SaaS weekly operating prompt

```text
Act as growth lead.
Given this week's data, produce:
1) what to stop
2) what to scale
3) what to test next
across acquisition, activation, retention, and expansion.
```

---

## 4) E-commerce Template

### 4.1 E-commerce skill set

```bash
npx skills add PlatoTheOne/marketingskills --skill `
  product-marketing-context `
  copywriting `
  copy-editing `
  page-cro `
  popup-cro `
  form-cro `
  paid-ads `
  ad-creative `
  email-sequence `
  social-content `
  analytics-tracking `
  referral-program `
  seo-audit `
  schema-markup
```

### 4.2 E-commerce day-1 prompts

```text
Read .agents/product-marketing-context.md and create:
1) PDP/collection/homepage messaging hierarchy
2) offer stack (discount, bundle, shipping threshold)
3) channel plan for paid + email + social.
```

```text
Audit our conversion funnel from traffic -> PDP -> cart -> checkout.
Output:
- friction points by step
- prioritized fixes by impact
- event tracking plan for each step.
Use page-cro, form-cro, analytics-tracking.
```

```text
Design a 21-day revenue sprint:
- paid ads test matrix
- email flow plan (welcome, cart recovery, post-purchase, win-back)
- creative production checklist.
Use paid-ads, ad-creative, email-sequence.
```

### 4.3 E-commerce weekly operating prompt

```text
Using this week's ROAS, CVR, AOV, and repeat purchase data:
1) identify biggest leakage
2) propose 3 immediate actions
3) propose 2 medium-term experiments
with owner and expected impact.
```

---

## 5) B2B Services Template

### 5.1 B2B services skill set

```bash
npx skills add PlatoTheOne/marketingskills --skill `
  product-marketing-context `
  copywriting `
  cold-email `
  email-sequence `
  sales-enablement `
  revops `
  paid-ads `
  social-content `
  seo-audit `
  competitor-alternatives `
  analytics-tracking `
  launch-strategy
```

### 5.2 B2B services day-1 prompts

```text
Read .agents/product-marketing-context.md and build:
1) offer ladder (entry offer -> core offer -> premium offer)
2) authority funnel (content, case study, proof assets)
3) demand capture plan (inbound + outbound).
```

```text
Create outbound system:
- ICP list criteria
- 5-touch cold email sequence
- reply handling playbook
- meeting-to-proposal handoff SOP.
Use cold-email, revops, sales-enablement.
```

```text
Create sales collateral kit:
- one-pager
- proposal template
- objection handling sheet
- discovery + demo talk track.
Use sales-enablement.
```

### 5.3 B2B services weekly operating prompt

```text
Given this week's funnel metrics (lead -> MQL -> SQL -> proposal -> close):
1) identify the weakest stage
2) propose fixes for messaging, process, and follow-up
3) define one experiment per stage.
Use revops, sales-enablement, cold-email.
```

---

## 6) Multi-Project Governance Template

Use this when you run many products in parallel.

### 6.1 Portfolio scorecard format

```markdown
# Weekly Marketing Portfolio Scorecard

## Project: [Name]
- North-star goal:
- Current focus:
- Top KPI 1:
- Top KPI 2:
- Top KPI 3:
- Biggest blocker:
- This week experiments:
- Next week priority:

## Project: [Name]
- North-star goal:
- Current focus:
- Top KPI 1:
- Top KPI 2:
- Top KPI 3:
- Biggest blocker:
- This week experiments:
- Next week priority:
```

### 6.2 Cross-project review prompt

```text
Review all project scorecards.
Rank projects by:
1) growth potential in next 30 days
2) urgency of intervention
3) expected ROI per unit of effort.
Then allocate team bandwidth across projects with rationale.
```

---

## 7) Practical Rules That Keep Teams Fast

- Always update `.agents/product-marketing-context.md` before major campaigns
- Keep one context file per project (never share one context across projects)
- Ask agent to cite assumptions when context is missing
- Run weekly "stop / start / scale" reviews
- Use `analytics-tracking` before scaling spend

