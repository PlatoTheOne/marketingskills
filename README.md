# 面向 AI 代理的 Marketing Skills

一个专注于营销任务的 AI 代理技能集合。面向技术型营销人和创业者打造，帮助你让 AI 编码代理参与转化率优化、文案写作、SEO、数据分析与增长工程。可用于 Claude Code、OpenAI Codex、Cursor、Windsurf，以及任何支持 [Agent Skills 规范](https://agentskills.io) 的代理。

由 [Corey Haines](https://corey.co?ref=marketingskills) 创建。需要实操支持？可查看 [Conversion Factory](https://conversionfactory.co?ref=marketingskills) - Corey 的机构，专注于转化优化、落地页与增长策略。想持续学习营销？订阅 [Swipe Files](https://swipefiles.com?ref=marketingskills)。想要一个能用这些技能担任你 CMO 的自治 AI 代理？试试 [Magister](https://magistermarketing.com?ref=marketingskills)。

如果你刚接触终端和编码代理，可阅读配套指南 [Coding for Marketers](https://codingformarketers.com?ref=marketingskills)。

**欢迎贡献！** 如果你找到了改进某个 skill 的方法，或想新增 skill，欢迎[提交 PR](#contributing)。

遇到问题或有疑问？欢迎[提交 issue](https://github.com/coreyhaines31/marketingskills/issues) - 我们很乐意协助。

## 什么是 Skill？

Skill 是 Markdown 文件，为 AI 代理提供特定任务的专业知识与工作流。把它们加入项目后，你的代理就能识别你正在处理营销任务，并自动应用合适的方法框架与最佳实践。

## 网页版预览

如果你想按网页方式查看本仓库的介绍内容，可使用以下方式：

- 在线预览（GitHub Pages）：`https://platotheone.github.io/marketingskills/`
- 临时预览（无需开启 Pages）：`https://htmlpreview.github.io/?https://raw.githubusercontent.com/PlatoTheOne/marketingskills/main/README.html`
- 本地直接打开（Windows）：在项目目录执行 `start .\\README.html`

## Skill 如何协同工作

各个 skill 会互相引用，并构建在共享上下文之上。`product-marketing-context` 是基础 skill - 其他所有 skill 在执行前都会先读取它，以理解你的产品、受众和定位。

```
                         +--------------------------------------+
                         |     product-marketing-context        |
                         |   (read by all other skills first)   |
                         +------------------+-------------------+
                                            |
    +---------------+ +-------------+ +----------------+ +------------------+ +----------------+ +----------------+ +-------------+
    | SEO & Content | | CRO         | | Content & Copy | | Paid & Measure   | | Growth &       | | Sales & GTM    | | Strategy    |
    +---------------+ +-------------+ +----------------+ +------------------+ | Retention      | +----------------+ +-------------+
    | seo-audit     | | page-cro    | | copywriting    | | paid-ads         | | referral-prog. | | revops         | | mktg-ideas  |
    | ai-seo        | | signup-cro  | | copy-editing   | | ad-creative      | | free-tool      | | sales-enable   | | mktg-psych  |
    | site-arch     | | onboarding  | | cold-email     | | ab-test-setup    | | churn-prev.    | | launch-strat.  | |             |
    | programmatic  | | form-cro    | | email-seq      | | analytics-track  | |                | | pricing        | |             |
    | schema-markup | | popup-cro   | | social-content | |                  | |                | | competitor-alt | |             |
    | content-strat | | paywall-cro | |                | |                  | |                | |                | |             |
    +---------------+ +-------------+ +----------------+ +------------------+ +----------------+ +----------------+ +-------------+

         Skills 之间会互相引用：
           copywriting -> page-cro -> ab-test-setup
           revops -> sales-enablement -> cold-email
           seo-audit -> schema-markup -> ai-seo
```

完整依赖关系请查看各个 skill 的 **Related Skills** 小节。

## 可用 Skills

<!-- SKILLS:START -->
| Skill | 说明 |
|-------|-------------|
| [ab-test-setup](skills/ab-test-setup/) | 当用户想规划、设计或实施 A/B 测试或实验时使用。用户提到 A/B 测试相关需求时也应使用。 |
| [ad-creative](skills/ad-creative/) | 当用户想生成、迭代或规模化广告创意时使用 - 包括标题、描述、主文案或完整广告... |
| [ai-seo](skills/ai-seo/) | 当用户想为 AI 搜索引擎优化内容、被 LLM 引用，或出现在 AI 生成答案中时使用... |
| [analytics-tracking](skills/analytics-tracking/) | 当用户想搭建、优化或审计分析追踪与衡量体系时使用。用户提到... 时也应使用。 |
| [churn-prevention](skills/churn-prevention/) | 当用户想降低流失、构建取消流程、设置挽回优惠、恢复失败付款等场景时使用... |
| [cold-email](skills/cold-email/) | 撰写能获得回复的 B2B 冷邮件及跟进序列。当用户想写冷启动外联邮件时使用... |
| [competitor-alternatives](skills/competitor-alternatives/) | 当用户想创建竞品对比页或替代页，用于 SEO 与销售赋能时使用。也可用于... |
| [content-strategy](skills/content-strategy/) | 当用户想规划内容策略、决定产出什么内容，或确定应覆盖哪些主题时使用。也可用于... |
| [copy-editing](skills/copy-editing/) | 当用户想编辑、审阅或优化既有营销文案时使用。用户提到 “edit this...” 等指令时也应使用。 |
| [copywriting](skills/copywriting/) | 当用户想撰写、重写或优化任意页面的营销文案时使用 - 包括首页、落地页等... |
| [email-sequence](skills/email-sequence/) | 当用户想创建或优化邮件序列、滴灌活动、自动化流程或生命周期邮件时使用... |
| [form-cro](skills/form-cro/) | 当用户想优化非注册类表单时使用 - 包括线索收集表单、联系表单等... |
| [free-tool-strategy](skills/free-tool-strategy/) | 当用户想为营销目的规划、评估或构建免费工具时使用 - 如获客、SEO 价值等... |
| [launch-strategy](skills/launch-strategy/) | 当用户想规划产品发布、功能公告或上线策略时使用。用户提到... 时也应使用。 |
| [lead-magnets](skills/lead-magnets/) | 当用户想创建、规划或优化用于邮件获客或线索获取的 Lead Magnet 时使用。也可用于... |
| [marketing-ideas](skills/marketing-ideas/) | 当用户需要其 SaaS 或软件产品的营销点子、灵感或策略时使用。也可用于... |
| [marketing-psychology](skills/marketing-psychology/) | 当用户想将心理学原则、思维模型或行为科学应用于营销时使用。也可用于... |
| [onboarding-cro](skills/onboarding-cro/) | 当用户想优化注册后引导、用户激活、首次体验或价值到达时间时使用。也可用于... |
| [page-cro](skills/page-cro/) | 当用户想优化、改进或提升任意营销页面转化率时使用 - 包括首页、落地页等... |
| [paid-ads](skills/paid-ads/) | 当用户需要 Google Ads、Meta（Facebook/Instagram）、LinkedIn、Twitter/X 等付费广告支持时使用... |
| [paywall-upgrade-cro](skills/paywall-upgrade-cro/) | 当用户想创建或优化应用内付费墙、升级页面、加购弹窗或功能门槛时使用。也可用于... |
| [popup-cro](skills/popup-cro/) | 当用户想创建或优化弹窗、模态框、覆盖层、滑入框或横幅以提升转化时使用。也可用于... |
| [pricing-strategy](skills/pricing-strategy/) | 当用户需要定价决策、套餐设计或变现策略支持时使用。用户提到... 时也应使用。 |
| [product-marketing-context](skills/product-marketing-context/) | 当用户想创建或更新产品营销上下文文档时使用。用户提到... 时也应使用。 |
| [programmatic-seo](skills/programmatic-seo/) | 当用户想用模板和数据规模化创建 SEO 页面时使用。用户提到... 时也应使用。 |
| [referral-program](skills/referral-program/) | 当用户想创建、优化或分析推荐计划、联盟计划或口碑策略时使用... |
| [revops](skills/revops/) | 当用户需要收入运营、线索生命周期管理或市场到销售交接流程支持时使用... |
| [sales-enablement](skills/sales-enablement/) | 当用户想创建销售资料、演示文稿、单页纸、异议处理文档或 Demo 脚本时使用。也可用于... |
| [schema-markup](skills/schema-markup/) | 当用户想在网站上添加、修复或优化 schema 标记与结构化数据时使用。用户提到... 时也应使用。 |
| [seo-audit](skills/seo-audit/) | 当用户想审计、复核或诊断网站 SEO 问题时使用。用户提到 “SEO...” 相关需求时也应使用。 |
| [signup-flow-cro](skills/signup-flow-cro/) | 当用户想优化注册、账户创建或试用激活流程时使用。用户提到... 时也应使用。 |
| [site-architecture](skills/site-architecture/) | 当用户想规划、梳理或重构网站页面层级、导航、URL 结构或内部链接时使用... |
| [social-content](skills/social-content/) | 当用户需要为 LinkedIn、Twitter/X、Instagram 等平台创建、排期或优化社媒内容时使用... |
<!-- SKILLS:END -->

## 安装

### 方式 1：CLI 安装（推荐）

使用 [npx skills](https://github.com/vercel-labs/skills) 直接安装 skills：

```bash
# 安装全部 skills
npx skills add coreyhaines31/marketingskills

# 安装指定 skills
npx skills add coreyhaines31/marketingskills --skill page-cro copywriting

# 列出可用 skills
npx skills add coreyhaines31/marketingskills --list
```

这会自动安装到你的 `.agents/skills/` 目录（并为 Claude Code 兼容性在 `.claude/skills/` 中创建符号链接）。

### 方式 2：Claude Code 插件

通过 Claude Code 内置插件系统安装：

```bash
# 添加 marketplace
/plugin marketplace add coreyhaines31/marketingskills

# 安装全部营销 skills
/plugin install marketing-skills
```

### 方式 3：克隆并复制

克隆整个仓库并复制 `skills` 文件夹：

```bash
git clone https://github.com/coreyhaines31/marketingskills.git
cp -r marketingskills/skills/* .agents/skills/
```

### 方式 4：Git Submodule

以子模块方式添加，便于后续更新：

```bash
git submodule add https://github.com/coreyhaines31/marketingskills.git .agents/marketingskills
```

然后从 `.agents/marketingskills/skills/` 引用技能。

### 方式 5：Fork 并定制

1. Fork 这个仓库
2. 按你的具体需求定制 skills
3. 把你的 fork 克隆到项目中

### 方式 6：SkillKit（多代理）

使用 [SkillKit](https://github.com/rohitg00/skillkit) 在多个 AI 代理（Claude Code、Cursor、Copilot 等）间安装 skills：

```bash
# 安装全部 skills
npx skillkit install coreyhaines31/marketingskills

# 安装指定 skills
npx skillkit install coreyhaines31/marketingskills --skill page-cro copywriting

# 列出可用 skills
npx skillkit install coreyhaines31/marketingskills --list
```

## 从 v1.0 升级

现在 skills 在产品营销上下文文件上使用 `.agents/`，而不再是 `.claude/`。请迁移你现有的上下文文件：

```bash
mkdir -p .agents
mv .claude/product-marketing-context.md .agents/product-marketing-context.md
```

skills 仍会把 `.claude/` 作为后备路径检查，因此不迁移也不会影响运行。

## 用法

安装完成后，你只需让代理协助营销任务：

```
"帮我优化这个落地页的转化率"
-> 使用 page-cro skill

"给我的 SaaS 写首页文案"
-> 使用 copywriting skill

"为注册事件设置 GA4 追踪"
-> 使用 analytics-tracking skill

"创建一个 5 封的欢迎邮件序列"
-> 使用 email-sequence skill
```

你也可以直接调用 skill：

```
/page-cro
/email-sequence
/seo-audit
```

## Skill 分类

### 转化率优化
- `page-cro` - 任意营销页面
- `signup-flow-cro` - 注册流程
- `onboarding-cro` - 注册后激活
- `form-cro` - 线索收集表单
- `popup-cro` - 模态框与覆盖层
- `paywall-upgrade-cro` - 应用内升级时机

### 内容与文案
- `copywriting` - 营销页面文案
- `copy-editing` - 编辑和润色现有文案
- `cold-email` - B2B 冷启动外联邮件及序列
- `email-sequence` - 自动化邮件流程
- `social-content` - 社交媒体内容

### SEO 与发现
- `seo-audit` - 技术 SEO 与页面 SEO
- `ai-seo` - AI 搜索优化（AEO、GEO、LLMO）
- `programmatic-seo` - 规模化页面生成
- `site-architecture` - 页面层级、导航与 URL 结构
- `competitor-alternatives` - 竞品对比与替代页
- `schema-markup` - 结构化数据

### 付费获客与分发
- `paid-ads` - Google、Meta、LinkedIn 广告活动
- `ad-creative` - 批量广告创意生成与迭代
- `social-content` - 社媒排期与策略

### 衡量与测试
- `analytics-tracking` - 事件追踪搭建
- `ab-test-setup` - 实验设计

### 留存
- `churn-prevention` - 取消流程、挽回优惠、催缴与支付恢复

### 增长工程
- `free-tool-strategy` - 营销工具与计算器
- `referral-program` - 推荐与联盟计划

### 策略与变现
- `marketing-ideas` - 140 个 SaaS 营销点子
- `marketing-psychology` - 心理模型与营销心理学
- `launch-strategy` - 产品发布与公告
- `pricing-strategy` - 定价、套餐与变现

### 销售与 RevOps
- `revops` - 线索生命周期、评分、路由与管道管理
- `sales-enablement` - 销售 Deck、单页纸、异议处理文档、Demo 脚本

## 贡献

找到了改进 skill 的方式？或者有新 skill 建议？欢迎 PR 和 issue。

查看 [CONTRIBUTING.md](CONTRIBUTING.md) 了解新增或改进 skills 的规范。

## 许可证

[MIT](LICENSE) - 你可以按需自由使用。
