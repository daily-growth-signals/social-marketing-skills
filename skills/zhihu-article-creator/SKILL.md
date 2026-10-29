---
name: zhihu-article-creator
description: Draft Zhihu answers or articles from live public Zhihu evidence via SignalDig MCP. Use when the user wants a Zhihu answer, article, angle, or rewrite grounded in current questions and answers—not a fixed style or hook pack. Requires SignalDig MCP; stop if disconnected.
slug: zhihu-article-creator
displayName: Zhihu Article Creator
version: 0.1.3
summary: Evidence-first Zhihu drafts with judgment craft, clear delivery, and no fingerprint templates.
tags: [zhihu, social, marketing, signaldig, mcp, writing]
license: MIT
metadata:
  version: "0.1.3"
  homepage: "https://signaldig.com/"
  depends_on: "research-growth-signals"
---

# Zhihu Article Creator

Retrieve current Zhihu public evidence through SignalDig, **judge** what is worth writing, then draft. The durable product is the thinking chain—not a viral template.

Core model: [references/thinking-model.md](./references/thinking-model.md)

- **Evidence** from SignalDig only  
- **Judgment** with argument craft (conclusion, gaps, premises, counters, boundaries)  
- **Draft** for Zhihu readers + clear Chinese for facts; never a shared hook/style pack  

Formulaic skeletons that only swap nouns create repetitive content platforms can detect. Outline must come from **this retrieval**.

This Skill has no data of its own.

## Newbie path

Minimize steps. No new project, no genre/hook menus, no YAML editing.

1. MCP missing → stop; send [Connect SignalDig](https://signaldig.com/agent-setup) in plain language.  
2. User gives a topic → research → judgment + draft in one pass when possible.  
3. Ask **at most one** question before the first draft, only if topic or answer-vs-article is unsafe to guess.  
4. Prefer a draft with `【待填】` over blocking on a full personal profile.

Language: match the user (usually zh-CN).

## Availability Gate

1. Find visible `research_social_signals` (exact client name; never invent `mcp__…`). How to self-check: open the client’s MCP tool list and look for that name under the SignalDig / `signaldig` server.  
2. Tool missing or auth rejected → **stop**. No invented hot ranks or “大家都在说”. No providers or machine error codes. Point to [agent-setup](https://signaldig.com/agent-setup).  
3. Prefer installed `research-growth-signals` for scoped research; if MCP is visible without it, continue with the live schema. `depends_on` means **recommended companion**, not “refuse to run if the research Skill folder is absent.”  
4. Tool visible but `get`/`results` errors → **do not** treat as disconnect. Check call shape first (see [evidence-workflow.md](./references/evidence-workflow.md)): `view="results"` needs `dataset` (topic posts → `social_posts`); `analysis_id` must be pasted **in full**.

## Not this Skill

- Style imitation libraries, catchphrase tables, permanent hook catalogs  
- Login / publish / vote automation  
- Claiming unread full answers from titles or snippets  
- Replacing `research-growth-signals` or website tools  

## Workflow

Details: [references/evidence-workflow.md](./references/evidence-workflow.md).

### 1. Clarify only when necessary

Topic, question URL/ID, or “help me pick something worth answering.”

### 2. Retrieve (SignalDig)

- Topic: `research_social_signals`, `scope.platforms=["zhihu"]`, focused request/search, modest budget, `research_depth` default `standard`, `refresh=false` unless asked.  
- Hot list / question / answers: use live resource operations (`zhihu_hot_list`, `zhihu_question_detail`, `zhihu_question_answers`, …) with smallest `target`; do not mix with topic `scope`/`search` in one submit.  
- Submit once → poll the **complete** `analysis_id` to terminal → read results with `view="results"` and `dataset="social_posts"` (topic posts).  
- Pagination: complete `result_cursor`, **max 3 pages**—later pages weaken; at the cap suggest **换词重搜** (new submit), do not exhaust. Triage 弱相关. Preserve coverage and limitations.  
- If `research-growth-signals` is present, follow its Social submit/get/reuse contract.

### 3. Judge (Layer B)

Before or with the draft, answer the Layer B questions in thinking-model.md. Tie each point to retrieved items or mark inference. No secret permanent scoring formula.

### 4. Draft (Layer C)

- Outline follows **this round’s** gaps and disputes.  
- Open with the judgment; support with evidence; mark personal/unverifiable bits `【待填】`.  
- Zhihu quality + fact clarity: [references/platform-quality.md](./references/platform-quality.md).  
- Optional A/B: change **one** layer only (opening phrasing **or** tone), same evidence.

### 5. Deliver

[references/delivery-contract.md](./references/delivery-contract.md) — Agent reply uses 做完了 / 需要你 / 知会; the Zhihu body is the deliverable inside 做完了.

## Hard rules

- No terminal evidence → no “知乎上现在” claims.  
- No providers, workflows, bindings, billing internals, machine error codes.  
- No fingerprint template packs.  
- No forcing the user through unrelated account/config mazes.  
- User-facing text: no internal jargon.

## References

- [thinking-model.md](./references/thinking-model.md)
- [evidence-workflow.md](./references/evidence-workflow.md)
- [delivery-contract.md](./references/delivery-contract.md)
- [platform-quality.md](./references/platform-quality.md)
- [examples.md](./references/examples.md)
