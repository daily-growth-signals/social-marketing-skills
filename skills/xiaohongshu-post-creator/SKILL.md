---
name: xiaohongshu-post-creator
description: Draft Xiaohongshu note copy and optional image briefs from live public note evidence via SignalDig MCP. Use for Xiaohongshu posts grounded in current notes—not a fixed carousel or hook pack. Requires SignalDig MCP; stop if disconnected. Does not publish or log in.
slug: xiaohongshu-post-creator
displayName: Xiaohongshu Post Creator
version: 0.1.3
summary: Evidence-first Xiaohongshu drafts with angle judgment, honest gaps, and no fingerprint templates.
tags: [xiaohongshu, rednote, social, marketing, signaldig, mcp, writing]
license: MIT
metadata:
  version: "0.1.3"
  homepage: "https://signaldig.com/"
  depends_on: "research-growth-signals"
---

# Xiaohongshu Post Creator

Retrieve current Xiaohongshu public notes through SignalDig, **judge** the angle, then draft copy. Optionally add an **image brief** for the client’s image tools—no binary images, no publish.

Core model: [references/thinking-model.md](./references/thinking-model.md)

- **Evidence** from SignalDig only  
- **Judgment** on saturation, specific gaps, honest user fit  
- **Draft** with honesty rules always on; Xiaohongshu may stay spoken and scene-led—do not force technical-doc tone  

Shared hook banks and fixed page skeletons create repetitive notes platforms can downrank. Structure must follow **this retrieval**.

## Newbie path

1. MCP missing → [Connect SignalDig](https://signaldig.com/agent-setup).  
2. One-line topic → research → judgment + draft.  
3. At most one clarifying question before first draft.  
4. `【待填】` for personal photos, prices, private results.  
5. If the tool reports `language` unsupported on Xiaohongshu, continue—mention it under 知会, do not stop as “MCP broken.”

Language: match the user (usually zh-CN).

## Availability Gate

1. Visible `research_social_signals` (exact client name). Self-check: MCP list under SignalDig / `signaldig`.  
2. Tool missing or auth rejected → stop; no fake trending notes; no error-code dumps; link [agent-setup](https://signaldig.com/agent-setup).  
3. Prefer `research-growth-signals` as a **recommended companion**; if MCP tools are visible without that Skill folder, continue on the live schema.  
4. Tool visible but results invalid → fix call shape first (`view=results` + `dataset`, full `analysis_id`)—see [evidence-workflow.md](./references/evidence-workflow.md). Do not send users to agent-setup for missing-`dataset` errors.

## Not this Skill

- Login, publish, comment, like, cookie automation  
- Permanent visual-director / “20 母版” packs  
- Claiming unread image contents  
- Replacing the data Skill `research-growth-signals`  

## Workflow

See [references/evidence-workflow.md](./references/evidence-workflow.md).

### 1. Clarify only when necessary

Topic, keywords, or user-supplied `user_id` / share URL for own-pacing signals.

### 2. Retrieve (SignalDig)

- Topic: `scope.platforms=["xiaohongshu"]`, modest budget, `refresh=false` unless asked.  
- Optional account/posts operations with exactly one real `target.user_id` or `share_url`.  
- Search suggestions ≠ note evidence.  
- Submit once → poll **complete** `analysis_id` to terminal → `view=results` + `dataset=social_posts` (and `social_profiles` when the schema requires it for account ops).  
- Pagination: complete `result_cursor`, **max 3 pages**—deeper pages get weaker relevance; at the cap, suggest **new query words** + new submit, do not keep paging. State page/count in 知会. `search.language` unsupported ≠ disconnect.  
- Preserve coverage/limitations; triage 弱相关 vs 强相关.

### 3. Judge (Layer B)

Answer Layer B in thinking-model.md; state sample size; no “全网爆款规律” from a thin page.

### 4. Draft copy (Layer C)

- Paraphrase patterns from the sample; never clone notes.  
- Hooks only if specific to this topic/sample—not from a shared library.  
- [references/platform-quality.md](./references/platform-quality.md).

### 5. Optional image brief

[references/image-brief.md](./references/image-brief.md). Never pretend files were generated.

### 6. Deliver

[references/delivery-contract.md](./references/delivery-contract.md) — 做完了 / 需要你 / 知会.

## Hard rules

- No terminal evidence → no platform-factual “现在小红书上…”.  
- No providers/workflows/billing internals.  
- No fingerprint template packs.  
- No install mazes for normal drafting.

## References

- [thinking-model.md](./references/thinking-model.md)
- [evidence-workflow.md](./references/evidence-workflow.md)
- [delivery-contract.md](./references/delivery-contract.md)
- [platform-quality.md](./references/platform-quality.md)
- [image-brief.md](./references/image-brief.md)
- [examples.md](./references/examples.md)
