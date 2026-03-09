# Product Requirements Derived from Public Feedback (2026-03)

_Source report: `docs/research/agent-product-feedback-report-2026-03.md`_

## How to read this document
Each requirement is structured as:
- **用户痛点**
- **需求**
- **目标用户**
- **为什么重要**
- **建议优先级**
- **Execution Venue**
- **可验证交付物**

This file is intended to convert public market feedback into development-ready requirements, not to repeat the report.

---

# 1. 透明执行（Transparent Execution）

## R1. Plan / Progress / Validation 必须显式化
- **用户痛点**：用户不信任“黑盒执行”，尤其讨厌 agent 在后台循环、改很多东西、最后只说一句“已经修好”。
- **需求**：所有非 trivial 任务都应显式暴露 `Goal / Plan / Progress / Validation / Next Step`。
- **目标用户**：所有 OpenClaw 用户，尤其是 coding / ops / research / release 用户。
- **为什么重要**：这是跨产品最强共识之一，直接决定信任感。
- **建议优先级**：P0
- **Execution Venue**：this repo
- **可验证交付物**：
  - 标准输出结构在核心 skill 中默认启用
  - 至少 4 类 benchmark 验证“进度可见”
  - 出现长任务时自动产生 progress update

## R2. 区分事实、推断、未验证状态
- **用户痛点**：很多产品会把“猜测”说成“结论”，导致误修、误判。
- **需求**：系统级规范中明确区分：`事实`、`推断`、`未验证`。
- **目标用户**：ops / research / docs / release 场景用户。
- **为什么重要**：可直接降低错误信心与误导。
- **建议优先级**：P0
- **Execution Venue**：this repo
- **可验证交付物**：
  - 输出模板中固定有 validation wording
  - benchmark rubric 加入 fact-vs-inference 评分项
  - 至少 3 个 example 显示这种边界

## R3. “继续执行”必须可观察，而不是静默推进
- **用户痛点**：用户说 continue 后，很多 agent 要么停住，要么偷偷做太多。
- **需求**：continue 模式必须显示“接下来做什么、为什么做、做到哪一步停”。
- **目标用户**：长任务、多步任务用户。
- **为什么重要**：提升 agentic 感，同时避免自治失控。
- **建议优先级**：P1
- **Execution Venue**：this repo
- **可验证交付物**：
  - continue-by-default 行为模板
  - checkpoint / progress 输出样例
  - long-task benchmark 覆盖 continue 场景

---

# 2. 路由 / 模式（Routing / Modes）

## R4. 任务模式必须明确分离
- **用户痛点**：用户不喜欢“讨论、调研、执行、改代码、发版”全都混成一种说话方式。
- **需求**：明确区分 discussion / research / coding / ops / docs / release / runtime 等模式。
- **目标用户**：进阶用户、团队用户、复杂工作流用户。
- **为什么重要**：模式混乱会导致执行边界不清、输出风格不稳定。
- **建议优先级**：P0
- **Execution Venue**：this repo
- **可验证交付物**：
  - 路由文档与 skill matrix 一致
  - 至少 6 个专门 skill 或子模式
  - benchmark 中可观察到模式差异

## R5. 默认模式与 specialized mode 的切换必须可解释
- **用户痛点**：用户不知道为什么系统突然“更像研究助手”或“更像编码 agent”。
- **需求**：所有路由切换都要可解释，并可在输出中短说明。
- **目标用户**：所有使用多 skill 的用户。
- **为什么重要**：提升可控感，降低“怎么突然变了”的疑惑。
- **建议优先级**：P1
- **Execution Venue**：this repo
- **可验证交付物**：
  - fallback policy 文档
  - runtime routing examples
  - 至少 2 个 benchmark 展示 mode shift

## R6. 高风险模式必须有显式确认点
- **用户痛点**：用户害怕 agent 在发布、重启、删改数据时自行推进。
- **需求**：release / runtime / destructive ops 默认带确认点。
- **目标用户**：ops、release、runtime 用户。
- **为什么重要**：这是 bounded autonomy 的关键。
- **建议优先级**：P0
- **Execution Venue**：this repo
- **可验证交付物**：
  - destructive-action checklist
  - stop/ask policy 文档
  - examples 显示 confirm-before-risk

---

# 3. 回滚 / 恢复（Rollback / Recovery）

## R7. 长任务必须支持 checkpoint
- **用户痛点**：任务中断、模型切换、服务重启后，用户不想从头解释一遍。
- **需求**：长任务必须可 checkpoint，记录已完成、阻塞、下一步。
- **目标用户**：所有长任务用户，尤其是 release / research / ops。
- **为什么重要**：长任务恢复能力是 agent 从 demo 变产品的关键。
- **建议优先级**：P0
- **Execution Venue**：this repo
- **可验证交付物**：
  - checkpoint template
  - resume / recovery guide
  - long-task benchmark example

## R8. 风险动作前必须支持 rollback path
- **用户痛点**：用户最怕“改坏了但不知道怎么回退”。
- **需求**：任何文件批量改动、配置切换、脚本化修复前，应给出 rollback path。
- **目标用户**：coding / ops / docs / release 用户。
- **为什么重要**：这是 trust-first execution 的基本保障。
- **建议优先级**：P0
- **Execution Venue**：this repo
- **可验证交付物**：
  - 修改前备份说明
  - rollback section in outputs
  - examples/before-after 中展示回退路径

## R9. 失败后应给出可恢复而非空洞结论
- **用户痛点**：很多 agent 失败后只说“无法完成”。
- **需求**：失败时必须输出：已检查内容、阻塞点、下一步、需要用户提供什么。
- **目标用户**：所有用户。
- **为什么重要**：失败体验直接决定是否继续使用。
- **建议优先级**：P1
- **Execution Venue**：this repo
- **可验证交付物**：
  - blocked format 模板
  - 至少 3 个 blocked examples
  - benchmark rubric 纳入“blocked usefulness”

---

# 4. 渠道接入（Channel / Entry Experience）

## R10. 首装流程必须覆盖主流渠道
- **用户痛点**：用户不希望“能接但要自己折腾很多隐藏配置”。
- **需求**：Telegram / Feishu / DingTalk / Webchat 等渠道，至少要有标准化接入路径。
- **目标用户**：非纯 CLI 用户；团队协作用户；聊天入口用户。
- **为什么重要**：对 OpenClaw 这类产品，入口体验就是产品体验。
- **建议优先级**：P0（产品侧）
- **Execution Venue**：OpenClaw core
- **可验证交付物**：
  - 每个主流渠道的安装/排障文档
  - first-install channel options 设计稿或实现
  - 渠道 smoke test/checklist

## R11. inbound/outbound 健康状态必须拆开显示
- **用户痛点**：Bot 看起来在线，但其实收不到消息，是最糟糕的半可用状态。
- **需求**：渠道健康状态至少拆为 inbound / outbound / auth / webhook|polling。
- **目标用户**：Telegram 等聊天入口用户。
- **为什么重要**：能大幅降低 silent failure。
- **建议优先级**：P0（产品/runtime）
- **Execution Venue**：OpenClaw core
- **可验证交付物**：
  - channel health model
  - CLI/UI 状态输出
  - 针对 409 conflict 的单独诊断项

## R12. pairing / auth / token 心智负担要下降
- **用户痛点**：auth/pairing/gateway token 错误容易把用户带到错误排障路径。
- **需求**：配对和鉴权流程应可视化、可诊断、可自检。
- **目标用户**：新用户、运维用户。
- **为什么重要**：首日体验决定大量流失。
- **建议优先级**：P1
- **Execution Venue**：OpenClaw core
- **可验证交付物**：
  - pairing status command
  - auth diagnostic guide
  - clearer error taxonomy

---

# 5. 工具稳定性（Tool Reliability）

## R13. 不允许 silent fallback 到“只会说不会做”
- **用户痛点**：工具失效后，agent 退化成只给建议，用户最反感。
- **需求**：工具不可用时必须显式说明，并输出原因/替代路径。
- **目标用户**：coding / ops / runtime 用户。
- **为什么重要**：agent 的核心承诺是“会执行”。
- **建议优先级**：P0
- **Execution Venue**：this repo
- **可验证交付物**：
  - tool exposure smoke tests
  - capability loss warning format
  - benchmark 检查 tool-first behavior

## R14. 工具契约与回调结果必须可见
- **用户痛点**：很多插件/工具其实执行了，但用户侧没收到明确结果。
- **需求**：工具调用契约、结果回传、失败路径要标准化。
- **目标用户**：插件/渠道用户，集成开发者。
- **为什么重要**：执行看不见等于没有执行。
- **建议优先级**：P0
- **Execution Venue**：cross-repo
- **可验证交付物**：
  - callback/result visibility docs
  - tool contract validation checks
  - integration snippets covering failure paths

## R15. provider / model 问题要精准归因
- **用户痛点**：429、auth、上游异常、配置错误混在一起会摧毁信任。
- **需求**：错误分类应区分 rate limit / auth / config / upstream failure / local routing failure。
- **目标用户**：所有使用外部模型/provider 的用户。
- **为什么重要**：用户会拿别的产品对照，如果这里错误更模糊就会被否定。
- **建议优先级**：P1
- **Execution Venue**：this repo
- **可验证交付物**：
  - provider error taxonomy
  - normalized error messages
  - troubleshooting docs with examples

---

# 6. 成本 / 可观测性（Cost / Observability）

## R16. loop、retry、工具耗时必须可见
- **用户痛点**：公共反馈最集中痛点之一就是“钱/时间不知道烧到哪去了”。
- **需求**：至少提供 loop count、retry count、阶段耗时、主要外部调用摘要。
- **目标用户**：重度用户、团队、付费模型用户。
- **为什么重要**：这是对抗“opaque billing/credit burn”最直接的方法。
- **建议优先级**：P1
- **Execution Venue**：runtime host
- **可验证交付物**：
  - execution summary footer
  - long-task metrics section
  - benchmark 增加 observability scoring

## R17. 用户需要 stop controls
- **用户痛点**：用户怕 agent 一旦跑起来就停不下来。
- **需求**：必须支持显式 stop/confirm/escalate 机制。
- **目标用户**：所有 agent 用户，尤其 builder/coding/ops 用户。
- **为什么重要**：bounded autonomy 不只是文档，而是控制面。
- **建议优先级**：P1
- **Execution Venue**：cross-repo
- **可验证交付物**：
  - stop/ask policy docs
  - release/runtime/coding examples
  - future runtime hooks 设计

## R18. 可观测性不能只在日志里
- **用户痛点**：很多产品把真相藏在日志里，普通用户看不到。
- **需求**：核心状态应以摘要方式暴露给用户，而不是只能翻日志。
- **目标用户**：非运维用户、聊天入口用户。
- **为什么重要**：日志是专家接口，不是产品接口。
- **建议优先级**：P1
- **Execution Venue**：cross-repo
- **可验证交付物**：
  - human-readable status blocks
  - concise failure summaries
  - docs examples showing status interpretation

---

# 7. 安全 / 权限（Safety / Permissions）

## R19. 高风险操作必须先界定 blast radius
- **用户痛点**：用户担心 agent 过度修改、越权访问、危险执行。
- **需求**：在高风险模式下显式声明会触达哪些文件/系统/服务。
- **目标用户**：所有关心安全与变更边界的用户。
- **为什么重要**：blast radius 不透明会让人完全不敢用。
- **建议优先级**：P0
- **Execution Venue**：this repo
- **可验证交付物**：
  - touched-files / touched-systems reporting
  - safe mode / full mode distinction
  - risky-action approval examples

## R20. 权限模型要让普通用户能理解
- **用户痛点**：权限存在，但用户不理解实际效果与边界。
- **需求**：对 tool exposure、文件写权限、命令执行权限做简洁解释层。
- **目标用户**：所有用户，尤其新用户。
- **为什么重要**：权限不透明 = 安全焦虑。
- **建议优先级**：P1
- **Execution Venue**：this repo
- **可验证交付物**：
  - permission model docs
  - setup examples with explicit exposure
  - user-facing error messages for denied actions

---

# 8. 支持 / 文档（Support / Documentation）

## R21. 文档必须面向“真实失败场景”
- **用户痛点**：很多文档只讲 happy path，不讲排障。
- **需求**：核心文档应覆盖 setup drift、runbook、release consistency、channel recovery。
- **目标用户**：所有用户，尤其 self-hosting 用户。
- **为什么重要**：支持能力弱时，文档就是第一线支持。
- **建议优先级**：P0
- **Execution Venue**：this repo
- **可验证交付物**：
  - docs benchmarks 扩展
  - troubleshooting guides
  - release/runbook/onboarding consistency checks

## R22. 社区贡献流程要让“反馈 -> benchmark -> 改进”闭环化
- **用户痛点**：很多开源项目收集了一堆吐槽，但没形成可复现改进。
- **需求**：把 benchmark 贡献、issue 模板、release checklist 串起来。
- **目标用户**：社区贡献者、维护者。
- **为什么重要**：这是 open upgrade-kit 的长期护城河。
- **建议优先级**：P1
- **Execution Venue**：this repo
- **可验证交付物**：
  - benchmark contribution guide
  - issue/PR templates
  - release checklist linked to benchmark evidence

---

# 9. Recommended near-term packaging of these requirements

## P0 themes
- transparent execution
- routing/mode separation for risky work
- checkpoint / rollback / recovery
- channel health + tool reliability
- blast-radius visibility
- real troubleshooting docs

## P1 themes
- better cost / loop / retry observability
- better auth/provider error taxonomy
- explicit stop controls
- stronger permission explainability
- contribution-to-benchmark workflow

## P2 themes
- broader channel coverage and richer platform polish
- more production-ready builder/coding specializations
- deeper automation once trust surfaces are already in place
