# 更新日志

## [0.1.3] - 2026-10-28

### 变更

- 翻页：完整 `result_cursor`，最多 **3 页**（后页相关性变弱）；触顶建议换词重新 submit；知会写明页数/条数
- 相关度分流：弱相关标注；判断与引用优先强相关
- 小红书：`search.language` unsupported 视为覆盖限制，不是断连

## [0.1.2] - 2026-10-28

### 修复

- 写明 `view=results` 必须带 `dataset`（话题帖用 `social_posts`）
- 区分调用形状错误与 MCP 未连接；`analysis_id` 必须完整粘贴
- Availability Gate：自检提示；`depends_on` 为推荐同装而非硬拒跑

## [0.1.1] - 2026-10-28

### 变更

- 新增 `thinking-model.md`：证据 / 判断 / 成稿三层，并写明反同质化（反指纹）规则
- 交付改为「做完了 / 需要你 / 知会」
- 知乎：论证判断 + 事实句纪律；去掉体裁×钩子菜单主路径
- 小红书：诚实纪律常开，保留口语场景感；不做共享钩子/母版库
- README 明确「学思考模型，不模仿文风」

## [0.1.0] - 2026-10-28

### 新增

- `zhihu-article-creator`：基于 SignalDig MCP 检索证据的知乎成稿 Skill
- `xiaohongshu-post-creator`：基于 SignalDig MCP 检索证据的小红书成帖 Skill
- 面向新手的一键复制安装说明
