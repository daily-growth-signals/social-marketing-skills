# Xiaohongshu evidence workflow

Agent-facing. Combine with [thinking-model.md](./thinking-model.md).

## Retrieve

1. Default `scope.platforms=["xiaohongshu"]` only.  
2. Modest `result_budget` unless the user asks wider.  
3. Account pacing needs user-supplied `user_id` or share URL + supported operation—never invent IDs.  
4. Search suggestions are not note evidence.  
5. Submit **once**. Store the returned `analysis_id` **in full**—never truncate (truncation → `invalid_analysis_id`).  
6. Poll `action="get"`, `view="status"`, complete `analysis_id` to terminal. Reuse until scope/refresh changes.

## Read results (required contract)

**Preferred:**

```json
{
  "action": "get",
  "analysis_id": "<COMPLETE analysis_id>",
  "view": "results",
  "dataset": "social_posts"
}
```

- `view="results"` requires `dataset`. Topic note search → `social_posts`.  
- Xiaohongshu account/profile reads may use `social_profiles` and/or `social_posts` per live schema—use separate result reads with the **same** full `analysis_id` when the schema says so.  
- Missing `dataset` with `view=results` → call-shape error, **not** MCP disconnect. Fix args; do not send users to agent-setup for that.  
- Legacy get without `view` may still return evidence; prefer explicit `view` + `dataset`.

### Pagination (max 3 pages)

If `has_more` and a `result_cursor` are returned:

1. Pass the **complete** `result_cursor` unchanged on the next `view=results` call (never invent or shorten cursors).  
2. Stop after **at most 3 result pages** (first page + up to 2 continuations), even if `has_more` remains true.  
3. **Why the cap:** deeper pages usually get **weaker relevance** (more noise / keyword-adjacent junk) and burn quota without better angles. Do **not** chase “pull until exhausted.”  
4. **When you hit the 3-page cap (or page 2–3 is already mostly 弱相关):** stop paging. Tell the user in 需要你 / 知会 that later pages are less relevant, and **suggest 1–3 tighter or alternate query words** for a **new** `submit` (new `analysis_id`) instead of another page. Examples: narrower scene, different verb, remove filler words, try a synonym the sample actually uses.  
5. In 知会, state clearly: e.g. `已读 2/3 页，共 N 条；仍有 more 未继续（后页相关性变弱，建议换词重搜）` or `已读满 3 页上限，共 N 条；建议换词再 submit，不要继续翻页`.

### Language constraint

`search.language` (or similar) may be reported as an **unsupported constraint** on Xiaohongshu. That is coverage information, **not** MCP failure—continue with returned notes and mention it under 知会.

## Diagnose before blaming MCP

| Symptom | Likely cause | Do |
| --- | --- | --- |
| No tool / auth fail | Not connected | Stop; [agent-setup](https://signaldig.com/agent-setup) |
| `invalid_research_request` on results | Missing/wrong `dataset` | Retry with correct `view` + `dataset` |
| `invalid_analysis_id` | Truncated id | Paste complete id |
| `language` unsupported | Platform constraint | Continue; note in 知会 |
| Thin/`partial` sample | Coverage | State sample size; no “全网规律” |

## Judge

Layer B: saturation, specific details vs hype, honest user gap, exaggeration risk. Always state sample size.

**Relevance triage:** mark items that only weakly match the user topic (e.g. music promo with a related keyword in the title, pure soft-furnishing “night room” with no tidy-up intent) as **弱相关**. Use them only as noise/context if at all; do **not** treat them as core evidence for the angle. Prefer strongly on-topic titles/descriptions for judgment and citations.

## Map → draft

| Need | Source |
| --- | --- |
| Framing | User topic + note titles |
| Tone cues | Paraphrase sample wording; do not clone |
| Proof | Returned metrics/excerpts only |
| Personal proof / photos | User or `【待填】` |
| Frames | Draft structure + observed post types if any |

## Draft

- No shared hook bank.  
- Structure from this sample; avoid fixed “封面+10 页” for every topic.  
- Empty research: no fake “基于笔记” body.
