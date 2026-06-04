# Reddit Posts for Claude Sales Expert

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

**Title:** I spent 10 hours/week researching leads manually. Built an AI tool to automate it.

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

**Link:** https://github.com/sidehero/claude-sales-expert

Not selling anything — it's open source. Just wondering if anyone else has automated their research process and what tools you're using.

---

## r/sales

**Flair:** [Tool/Resource]

**Title:** Stop manually researching leads. Here's what I built (free, open source)

**Body:**

Quick question for the sales folks here:

How much time do you spend on research before reaching out to a prospect? 10 minutes? 30? An hour?

I was spending way too much. So I built something to fix it.

**What it does:**
- Takes a company name/website
- Uses AI to research: funding, employees, tech stack, business model
- Finds relevant contacts (not just any contact — the right ones for your use case)
- Scores the lead based on criteria you set

**The catch:**
It's not a SaaS product you pay for. It's a desktop app that runs locally using Claude Code. No subscription, no API fees.

**Why am I sharing?**
Because I've been where you are. Spending hours on research, getting burned out, wondering if there's a better way.

Check it out if interested: https://github.com/sidehero/claude-sales-expert

What's your current research process? Still doing it manually?

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