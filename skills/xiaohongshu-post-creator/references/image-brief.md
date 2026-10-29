# Image brief (for client image tools)

This Skill does **not** render PNG/JPEG. When images are needed, output a brief the Agent can pass to its own image capability or that the user can hand to a designer.

## When to include

- User asks for 配图 / 封面 / 组图
- Draft is clearly image-led (步骤图、对比图) and the user did not forbid images

## Brief format

For each frame:

- **角色**：封面 / 内页 N
- **尺寸建议**：默认 3:4 笔记图，除非用户指定
- **画面**：主体、文字叠加（短）、背景、勿含的元素
- **文字叠加原稿**：必须与笔记标题/要点一致；可含 `【待填】`
- **依据**：为何需要这帧（对应草稿哪一段）；勿谎称来自某笔记原图像素

## Rules

- Do not say images were generated, downloaded, or uploaded.
- Do not require a third-party paid image API inside this Skill.
- If the Agent cannot generate images, still deliver the note copy + brief, and say the user can generate elsewhere.
