# SignalDig Social Marketing Skills

Open-source Agent Skills for **evidence-based social marketing drafts**. Each Skill retrieves public platform evidence through [SignalDig](https://signaldig.com/) MCP, then judges, summarizes, and drafts content with visible sources. They are scene Skills—not a second data layer.

Works with Codex, Claude Code, Cursor, Windsurf, and other clients that support Agent Skills and Streamable HTTP MCP.

[Connect SignalDig](https://signaldig.com/agent-setup) · [Data Skill: seo-signal-skills](https://github.com/daily-growth-signals/seo-signal-skills) · [Latest release](https://github.com/daily-growth-signals/social-marketing-skills/releases/latest) · [中文说明](#中文说明)

## What this repo is

| Layer | Repository | Role |
| --- | --- | --- |
| Data | [`seo-signal-skills`](https://github.com/daily-growth-signals/seo-signal-skills) (`research-growth-signals`) | How to retrieve the smallest useful public Social/SEO evidence through SignalDig MCP |
| Scene (this repo) | `social-marketing-skills` | How to turn that evidence into platform drafts |

These Skills **do not ship writing gimmicks that go stale**. They teach a thinking chain—retrieve → judge → draft—so each outline follows **this retrieval’s** coverage and gaps. Fixed hook banks and swap-the-noun skeletons create repetitive posts that platforms can detect; that is intentionally out of scope.

Missing personal facts stay `【待填】`—never invented as observed evidence. Agent replies use a short receipt (done / need you / FYI). Zhihu drafts lean on checkable depth; Xiaohongshu keeps spoken scene voice while staying honest about facts.

They also **do not log in, publish, comment, or like**. Publishing stays with you or other tools.

## Maintained Skills

| Skill | Use when |
| --- | --- |
| [`zhihu-article-creator`](./skills/zhihu-article-creator/) | Find a Zhihu angle and draft an answer/article grounded in current public Zhihu evidence |
| [`xiaohongshu-post-creator`](./skills/xiaohongshu-post-creator/) | Draft a Xiaohongshu note (copy + optional image brief) grounded in current public note evidence |

Install only the scene you need. You do not need every Skill in the repo.

## Fastest path for new users

You should not create extra projects, YAML files, or second API accounts. Use the same SignalDig connection you already set up for research.

### 1. Connect SignalDig once

If MCP is not connected yet, open [Connect SignalDig](https://signaldig.com/agent-setup), sign in, create a key, and paste the page’s setup request into your AI. Also install `research-growth-signals` when the page asks you to.

### 2. Install one scene Skill

Copy one of these to your AI (after SignalDig is connected):

**Zhihu**

```text
Install the SignalDig Skill zhihu-article-creator from https://github.com/daily-growth-signals/social-marketing-skills. Put skills/zhihu-article-creator into this client’s skills directory. Then confirm SignalDig MCP is connected. Do not ask me to create a new project or edit config files unless the client requires a protected secret field for the existing SignalDig API key.
```

**Xiaohongshu**

```text
Install the SignalDig Skill xiaohongshu-post-creator from https://github.com/daily-growth-signals/social-marketing-skills. Put skills/xiaohongshu-post-creator into this client’s skills directory. Then confirm SignalDig MCP is connected. Do not ask me to create a new project or edit config files unless the client requires a protected secret field for the existing SignalDig API key.
```

### 3. Start with one sentence

```text
根据当前知乎上关于「……」的公开讨论，帮我判断是否值得写，并起草一篇带来源的回答。缺我个人经历的地方标【待填】。
```

```text
根据当前小红书上关于「……」的公开笔记，帮我判断切入点，并起草一篇可发布文案；需要配图时只给画面说明，不要假装已经出图。缺我个人素材的地方标【待填】。
```

## Manual install (optional)

```bash
git clone https://github.com/daily-growth-signals/social-marketing-skills.git
```

Copy one Skill folder into your client:

| Client | Skills directory |
| --- | --- |
| Codex | `~/.codex/skills/` |
| Claude Code | `~/.claude/skills/` |
| Cursor | `~/.cursor/skills/` |
| Windsurf | `~/.windsurf/skills/` |

Example:

```bash
mkdir -p "$HOME/.codex/skills/zhihu-article-creator"
cp -R skills/zhihu-article-creator/. "$HOME/.codex/skills/zhihu-article-creator/"
```

You can also download a packaged zip from the [latest GitHub release](https://github.com/daily-growth-signals/social-marketing-skills/releases/latest).

## Requirements

- A SignalDig API key configured as a **secret** / protected field (never pasted into chat, never committed)
- SignalDig MCP at `https://mcp.signaldig.com/mcp`
- Recommended: install [`research-growth-signals`](https://github.com/daily-growth-signals/seo-signal-skills) so research calls stay scoped and safe

If MCP is unavailable, these Skills stop. They must not invent platform evidence from general knowledge.

## 中文说明

SignalDig Social Marketing Skills 是一组**基于公开检索证据**的社媒营销场景 Skill：先通过 SignalDig MCP 拉取当下相关内容，再判断、总结并起草可发布草稿，并标明来源与缺口。

- 底层取数：请先按 [接入说明](https://signaldig.com/agent-setup) 连接 MCP，并安装 [`research-growth-signals`](https://github.com/daily-growth-signals/seo-signal-skills)。
- 本仓库场景：[`zhihu-article-creator`](./skills/zhihu-article-creator/)（知乎成稿）、[`xiaohongshu-post-creator`](./skills/xiaohongshu-post-creator/)（小红书成帖文案 + 可选画面说明）。
- 学的是判断与成稿**思考模型**（证据、论证、清楚表达），不是模仿某个网红文风或永久钩子库；结构随当次检索变化，降低同质化。
- **不是**自动登录发帖工具。
- 新手路径：接入一次 SignalDig → 复制上面的安装句给 AI → 用一句话描述主题即可；缺个人经历处标【待填】。

## License

[MIT](./LICENSE)
