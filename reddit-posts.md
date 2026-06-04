# Reddit Posts for Claude Sales Expert

## Positioning as Open Source Alternative

**Paid tools this replaces:**
- Apollo ($39-119/mo)
- ZoomInfo ($5,000-15,000+/yr)
- Clearbit ($199+/mo)
- Lusha ($299+/mo)

**Key differentiators:**
- Free forever (no subscriptions)
- No credit limits
- Your data stays local
- Custom scoring criteria
- Open source — customize it however you want

---

## r/indiehackers

**Flair:** Launch

---

**Title:** Built a desktop app that researches B2B leads using Claude Code (open source)

**Body:**

Been working on this for a while and finally got it to a point where I'm not embarrassed to share.

**What it does:**
- Researches companies automatically (finds funding, employees, tech stack, business model)
- Scores leads against custom criteria (configurable — industry, company size, growth signals)
- Discovers contacts at each company with their roles and LinkedIn
- Generates personalized conversation topics for outreach

**Tech stack:**
- Tauri 2 (Rust + React)
- Claude CLI as the AI brain
- SQLite for local storage

**Why Claude Code?** 
Tried using APIs directly first. Too expensive, rate limits everywhere. Claude Code runs locally, no API costs, and honestly the results are better because you can give it much more context.

**The pain this solves:**
I was spending 5+ hours a week manually researching leads. Now I add a company, click "Research", and watch it happen in real-time. 50 companies in about 30 minutes.

**The cost angle:**
I've used Apollo. I've used ZoomInfo trials. The problem isn't finding data — it's the cost. Apollo wants $79/mo for basic access. ZoomInfo is $5,000+/year. And that's before you hit export limits.

This is free. Open source. Your data stays on your machine.

**Link:** https://github.com/sidehero/claude-sales-expert

Would love feedback from people who actually do outbound sales. Is this useful or am I building something nobody wants?

---

## r/ClaudeAI

**Flair:** Showoff

**Title:** Built a full desktop app using only Claude Code (no cursor, no copilot)

**Body:**

So I built an entire Tauri app — company research, lead scoring, contact discovery — all by just chatting with Claude Code.

No VS Code extensions. No AI copilots. Just me + Claude CLI.

**The workflow:**
1. I'd describe what I wanted
2. Claude would write the code
3. I'd run it, report errors
4. Claude would fix them
5. Repeat until it worked

**Surprising things I learned:**
- Claude Code can handle complex multi-file projects if you give it the full context
- The `CLAUDE.md` file is a game changer — I put architecture notes there and it actually follows them
- Debugging Rust errors together works better than I expected

**The app:** https://github.com/sidehero/claude-sales-expert

It's a B2B lead research tool if anyone cares. But mostly I'm curious — has anyone else built a complete app using only Claude CLI? What's your experience been?

---

## r/SaaS

**Flair:** Showoff Saturday (if available) or Discussion

**Title:** I spent 10 hours/week researching leads manually. Built an AI tool to automate it — for free.

**Body:**

For those who don't know me — I do outbound sales. B2B. Cold emails, LinkedIn, the whole thing.

**The problem:**
Research was killing me. Before every outreach, I needed to know: what does this company do? Who are they? What's their funding situation? Any recent news?

Google, LinkedIn, company websites, Crunchbase... 10 hours a week easy. Maybe more.

**The solution:**
Built a desktop app that uses Claude Code to research companies automatically.

- Add a company → it scrapes public info, finds contacts, scores the lead
- Custom scoring criteria (I set mine: SaaS only, 50-500 employees, recent funding)
- Tiers: Hot, Warm, Nurture, Disqualified

**Results after 2 months:**
- Lead research time: 10 hrs/week → 2 hrs/week
- Response rate: up slightly (better research = better outreach)
- More consistent — I actually research every lead now instead of skipping it

**The cost reality:**
I tried Apollo. $79/mo got me maybe 5,000 contacts before credits ran out. ZoomInfo? $5,000/year for what amounts to a fancy search bar.

This is free. Open source. No credit limits. No vendor lock-in.

**Link:** https://github.com/sidehero/claude-sales-expert

Not selling anything — it's open source. Just wondering if anyone else has automated their research process and what tools you're using.

---

## r/sales

**Flair:** [Tool/Resource]

**Title:** Stop paying for lead research. Here's the free alternative I built.

**Body:**

Quick question for the sales folks here:

How much are you paying for Apollo? ZoomInfo? Lusha?

I was on the Apollo $79/mo plan. Then $119/mo because basic wasn't enough. Still hitting export limits. Still not getting the data I actually needed.

**The problem with paid tools:**
- Credit limits that run out fast
- Data that's 6 months old
- Your company data being sold to your competitors (hello, ZoomInfo)
- $5,000+ yearly contracts for "enterprise" features

**What I built instead:**
A desktop app that researches companies using AI. No subscriptions. No credit limits.

- Takes a company name/website
- Uses AI to research: funding, employees, tech stack, business model
- Finds relevant contacts (not just any contact — the right ones for your use case)
- Scores the lead based on criteria you set

**The trade-off:**
It's a desktop app, not a web service. You run it locally. But for that trade-off, you get:
- Zero monthly cost
- Unlimited research
- Your data stays with you

**Link:** https://github.com/sidehero/claude-sales-expert

What's your current research stack? Still paying for ZoomInfo?

---

## r/ArtificialIntelligence

**Flair:** Project

**Title:** Built an AI-powered B2B lead research tool using Claude Code (no API costs)

**Body:**

Most AI tools for sales cost an arm and a leg. API credits, monthly subscriptions, rate limits. So I built something different.

**The approach:**
Using Claude Code instead of API calls. Runs locally on your machine. No per-token costs.

**What the app does:**
1. Company research — pulls funding info, employee count, tech stack, business model
2. Contact discovery — finds relevant people at the company
3. Lead scoring — evaluates against configurable criteria (industry, size, growth signals)
4. Conversation generation — creates personalized talking points for outreach

**The cost comparison:**
| Tool | Monthly Cost | Hidden Costs |
|------|--------------|--------------|
| Apollo | $79/mo | Export limits |
| ZoomInfo | $5,000+/yr | Seat fees |
| Clearbit | $199/mo | Per-enrichment API calls |
| **This app** | **$0** | **None** |

**Technical details:**
- Tauri 2 (Rust backend + React frontend)
- Claude CLI as the AI engine
- SQLite for local data
- Max 5 concurrent research jobs

**The trade-off:**
It's a desktop app, not a web service. But for anyone doing serious outbound, having your data local and no per-use costs might be worth it.

**Link:** https://github.com/sidehero/claude-sales-expert

Curious what others think — is local AI the future, or am I just impatient with API costs?

---

## r/tauri_app

**Flair:** Show

**Title:** First Tauri project — built a B2B lead research app. Here's what I learned.

**Body:**

Just shipped my first Tauri app. Been a while since I built something from scratch and wanted to share the experience.

**The app:**
Claude Sales Expert — a desktop app for B2B lead research powered by Claude Code.

**What I used:**
- Tauri 2
- React 19 + TypeScript
- Tailwind CSS 4
- Zustand for state
- SQLite (rusqlite with WAL mode)

**Things that surprised me:**
1. The hot reload is actually fast. Like, genuinely usable.
2. Building for Windows and macOS from one codebase works better than expected
3. Rust's async story with Tokio made the job queue easier than I thought
4. The Tauri 2 permissions system took some getting used to but makes sense

**Things that were hard:**
1. Getting Claude CLI output streaming back to the frontend in real-time
2. Handling job recovery when the app crashes mid-research
3. Getting the icon config right for both platforms

**Link:** https://github.com/sidehero/claude-sales-expert

Would love feedback from people who know Tauri better than I do. What did I do wrong?