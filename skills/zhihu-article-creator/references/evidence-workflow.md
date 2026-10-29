# Zhihu evidence workflow

Agent-facing. Combine with [thinking-model.md](./thinking-model.md).

## Retrieve

1. Smallest useful Zhihu scope.  
2. Topic: `research_social_signals` with `scope.platforms=["zhihu"]` unless the user asks for cross-platform.  
3. Known question ID/URL: prefer question detail + bounded answers when the live schema supports it.  
4. Hot list = “what is moving,” not a substitute for topic search—say so in 知会 when used.  
5. Submit **once** with `action="submit"`. Store the returned `analysis_id` **in full**—it is long; never truncate or shorten. Truncation causes `invalid_analysis_id`.  
6. Poll with `action="get"`, `view="status"`, and the **complete** `analysis_id` until terminal (`completed` / `partial` / `failed`). Do not resubmit only because work is slow.  
7. Reuse the same full `analysis_id` until the user changes scope or asks for refresh.

## Read results (required contract)

After status is terminal, read evidence with `research_social_signals`:

**Preferred (explicit dataset):**

```json
{
  "action": "get",
  "analysis_id": "<paste the COMPLETE analysis_id>",
  "view": "results",
  "dataset": "social_posts"
}
```

- When `view="results"`, **`dataset` is required**. For topic Zhihu posts use `dataset="social_posts"`.  
- Omitting `dataset` with `view="results"` often returns `invalid_research_request`—this is a **call-shape error**, not “MCP disconnected.” Fix the arguments and retry the same `analysis_id`; do not send the user to agent-setup for this case.

**Also valid:** a legacy `action="get"` with the full `analysis_id` and **no** `view` may still return `evidence` / items (live schema dependent). Prefer the explicit `view` + `dataset` form above when the schema lists them.

For Zhihu **resource** operations (hot list, question detail, etc.), use the dataset name the live schema returns for that operation (often `social_resources`). Do not invent dataset names; if unsure, read status/result hints or the tool schema.

### Pagination (max 3 pages)

If `has_more` and a `result_cursor` are returned:

1. Pass the **complete** `result_cursor` unchanged (never invent or shorten).  
2. Stop after **at most 3 result pages** (first + up to 2 continuations), even if `has_more` is still true.  
3. **Why the cap:** later pages usually have **weaker relevance** and more off-topic hits; exhausting cursors wastes quota.  
4. **At the 3-page cap (or when page 2–3 is mostly 弱相关):** stop paging. In 需要你 / 知会 explain that deeper pages get weaker, and **suggest 1–3 alternate / tighter query words** for a **new** `submit` (new `analysis_id`) instead of more pages.  
5. In 知会: `已读 k/3 页，共 N 条；仍有 more 未继续（后页相关性变弱，建议换词重搜）` or `已读满 3 页上限，共 N 条；建议换词再 submit`.

Unsupported language/time constraints in `coverage`/`limitations` are coverage facts, not disconnect signals.

## Diagnose before blaming MCP

| Symptom | Likely cause | Do |
| --- | --- | --- |
| Tool not in the MCP list / auth rejected | Not connected | Stop; link [agent-setup](https://signaldig.com/agent-setup) |
| `invalid_research_request` on results | Missing `dataset` or wrong view/dataset pair | Retry get with `view=results` + correct `dataset` |
| `invalid_analysis_id` | Truncated or wrong id | Copy the full id from submit/status |
| Unsupported `language` / filters | Platform constraint | Continue; note in 知会 |
| `partial` / empty items | Coverage limit | Draft only from returned items; state limitations |

## Judge (before drafting)

Run Layer B questions. Output must be disagreeable by a human (not mystic scores):

- Worth writing?  
- Covered vs gap?  
- Premise / counter / boundary?  
- What only the user can add?  

Each bullet: evidence pointer or “推断”.

**Relevance triage:** label off-topic or barely related hits as **弱相关** (e.g. wrong product category sharing a keyword). Cite and lean on strongly on-topic items; mention 弱相关 only as sample noise if needed.

## Map → draft materials

| Need | Source |
| --- | --- |
| Question framing | Question title or user topic |
| Common takes | Titles/excerpts in sample |
| Gap / dispute | Missing or conflicting angles in sample |
| Citations | Returned URLs only |
| Stance / story / credentials | User or `【待填】` |

## Draft

- Glue materials lightly; do not free-write a parallel essay that ignores the sample.  
- Skeleton must change when the sample’s gaps change (anti-fingerprint).  
- No-evidence path: say research failed; optional skeleton must not claim live platform facts.
