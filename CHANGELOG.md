# Changelog

## [0.1.3] - 2026-10-28

### Changed

- Pagination: full `result_cursor`, hard cap **3 pages** (later pages weaker); at cap suggest new query words + new submit; report pages/counts in 知会
- Relevance triage: label 弱相关; cite strong matches for judgment
- Xiaohongshu: unsupported `search.language` is coverage, not disconnect

## [0.1.2] - 2026-10-28

### Fixed

- Document `view=results` + required `dataset` (topic posts → `social_posts`)
- Clarify call-shape errors vs MCP disconnect; keep full `analysis_id`
- Availability Gate: self-check tip; `depends_on` = recommended companion

## [0.1.1] - 2026-10-28

### Changed

- Added per-skill `thinking-model.md`: evidence / judgment / draft layers; anti-fingerprint rules
- Delivery contracts use 做完了 / 需要你 / 知会
- Zhihu: argument craft + fact clarity; no genre×hook menus
- Xiaohongshu: honesty always on; spoken voice allowed; no shared hook/carousel packs
- README clarifies thinking-model vs style imitation

## [0.1.0] - 2026-10-28

### Added

- `zhihu-article-creator`: evidence-first Zhihu draft Skill via SignalDig MCP
- `xiaohongshu-post-creator`: evidence-first Xiaohongshu note draft Skill via SignalDig MCP
- Repository README with newbie copy-paste install prompts
