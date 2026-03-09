# Executable Backlog from Public Feedback (2026-03)

_Source report: `docs/research/agent-product-feedback-report-2026-03.md`_

Each item is designed so a later delegated worker can pick it up directly.

Columns:
- **归属**: product / runtime / skill / docs / benchmark / scripts
- **复杂度**: S / M / L
- **完成定义**: concrete done condition

---

## P0 backlog

### B01. Add transparent execution block to all core skill outputs
- **解决什么反馈**：黑盒执行、不可见进度、信任不足
- **归属**：skill
- **复杂度**：M
- **完成定义**：所有核心 skill 文档明确要求 Goal/Plan/Progress/Validation/Next Step

### B02. Add fact-vs-inference wording standard
- **解决什么反馈**：把猜测说成结论
- **归属**：skill/docs
- **复杂度**：S
- **完成定义**：统一 wording 文档 + 至少 3 个 example 更新

### B03. Add blocked-state response template everywhere
- **解决什么反馈**：失败后只给空话
- **归属**：skill
- **复杂度**：S
- **完成定义**：核心 skill references 出现 blocked format

### B04. Create channel health model doc (inbound/outbound/auth/webhook-polling)
- **解决什么反馈**：Bot 在线但收不到消息
- **归属**：runtime/docs
- **复杂度**：M
- **完成定义**：新增 health model 文档并被 integration docs 引用

### B05. Add Telegram 409 conflict runbook benchmark
- **解决什么反馈**：silent failure / conflict 难定位
- **归属**：benchmark/docs
- **复杂度**：M
- **完成定义**：新增 benchmark result example + troubleshooting guide section

### B06. Add tool exposure smoke-test checklist
- **解决什么反馈**：只会说不会做 / silent fallback
- **归属**：benchmark/scripts
- **复杂度**：M
- **完成定义**：新增 smoke-test 文档或脚本，覆盖 tool availability

### B07. Add capability-loss warning format
- **解决什么反馈**：能力退化无提示
- **归属**：skill/docs
- **复杂度**：S
- **完成定义**：定义统一 warning wording 并在 examples 中出现

### B08. Add touched-files / touched-systems reporting spec
- **解决什么反馈**：blast radius 不清楚
- **归属**：skill/runtime
- **复杂度**：M
- **完成定义**：新增 reporting spec，并在 runtime/release skill 中引用

### B09. Add risky-action confirmation pattern
- **解决什么反馈**：发布/重启/危险操作过于自动
- **归属**：skill/runtime
- **复杂度**：S
- **完成定义**：runtime/release/ops skill 均带 confirm-before-risk pattern

### B10. Add rollback-path section to coding/ops/release outputs
- **解决什么反馈**：改坏了不知道怎么退
- **归属**：skill
- **复杂度**：M
- **完成定义**：三类 skill references 更新 + examples 覆盖 rollback path

## P1 backlog

### B11. Add routing-decision summary format
- **解决什么反馈**：用户不知道为什么切模式
- **归属**：runtime/skill
- **复杂度**：S
- **完成定义**：runtime docs + examples 出现 route explanation block

### B12. Add loop/retry observability section
- **解决什么反馈**：不知道时间/成本烧在哪
- **归属**：runtime/docs
- **复杂度**：M
- **完成定义**：新增 observability summary 模板

### B13. Add provider error taxonomy doc
- **解决什么反馈**：429/auth/config/upstream 错误混淆
- **归属**：docs/runtime
- **复杂度**：M
- **完成定义**：新增 taxonomy 文档 + examples

### B14. Add permission model explainer
- **解决什么反馈**：权限边界不透明
- **归属**：docs
- **复杂度**：S
- **完成定义**：新增 permission model 文档，列出常见拒绝场景

### B15. Add continue-by-default benchmark case
- **解决什么反馈**：continue 后要么卡住要么乱跑
- **归属**：benchmark
- **复杂度**：S
- **完成定义**：新增一个 long-task/continue benchmark result

### B16. Add human-readable status summary patterns
- **解决什么反馈**：状态只能看日志
- **归属**：docs/skill
- **复杂度**：S
- **完成定义**：新增 status summary 模板并接入 integration docs

### B17. Add auth/pairing diagnosis guide
- **解决什么反馈**：pairing/token/gateway token 心智负担高
- **归属**：docs/runtime
- **复杂度**：M
- **完成定义**：新增诊断指南，包含 symptom -> likely cause -> next step

### B18. Add docs benchmark for troubleshooting quality
- **解决什么反馈**：文档只讲 happy path
- **归属**：benchmark/docs
- **复杂度**：M
- **完成定义**：新增一个 runbook-quality benchmark subtype

### B19. Add release evidence bundle checklist
- **解决什么反馈**：发布前不知道是否真的 ready
- **归属**：release/docs
- **复杂度**：S
- **完成定义**：release checklist 增加 evidence bundle 条目

### B20. Add community issue template for runtime failures
- **解决什么反馈**：反馈碎片化，难复现
- **归属**：docs/benchmark
- **复杂度**：S
- **完成定义**：新增 issue template，要求最小可复现信息

## P2 backlog

### B21. Add host-specific layout case: shared team deployment
- **解决什么反馈**：多宿主/团队环境接入不清晰
- **归属**：runtime/docs
- **复杂度**：M
- **完成定义**：新增 layout example

### B22. Add host-specific layout case: desktop-first local install
- **解决什么反馈**：桌面/本地入口不足
- **归属**：runtime/docs
- **复杂度**：M
- **完成定义**：新增 local-first layout example

### B23. Add builder “surgical edit mode” guidance
- **解决什么反馈**：builder 产品大改一通，难维护
- **归属**：docs/skill
- **复杂度**：M
- **完成定义**：新增 builder-like surgical patch guidance

### B24. Add research benchmark for pricing/spec drift
- **解决什么反馈**：信息过时，产品事实不准
- **归属**：benchmark
- **复杂度**：S
- **完成定义**：新增至少 1 个新 research result case

### B25. Add docs/code/config consistency sweep playbook
- **解决什么反馈**：demo 到 production 之间文档失真
- **归属**：docs/skill
- **复杂度**：M
- **完成定义**：新增 consistency sweep playbook

### B26. Add release dry-run auto-summary helper
- **解决什么反馈**：发布前状态靠手工汇总
- **归属**：scripts/release
- **复杂度**：M
- **完成定义**：新增脚本生成 dry-run summary 草稿

### B27. Add event-driven / scheduled task design note
- **解决什么反馈**：用户期待自动化与长期执行
- **归属**：runtime/docs
- **复杂度**：L
- **完成定义**：新增设计文档，列边界、风险、checkpoint 需求

### B28. Add benchmark for dangerous-action containment
- **解决什么反馈**：agent 破坏性过强
- **归属**：benchmark
- **复杂度**：M
- **完成定义**：新增 blast-radius containment benchmark

### B29. Add integration docs for recommended vs experimental plugins/channels
- **解决什么反馈**：默认集成和社区偏好不透明
- **归属**：docs/product
- **复杂度**：S
- **完成定义**：新增分层说明：official / recommended / experimental

### B30. Add support-surface documentation policy
- **解决什么反馈**：支持质量成为产品质量
- **归属**：docs/product
- **复杂度**：S
- **完成定义**：新增文档说明哪些问题靠 docs、哪些靠 issue、哪些需人工支持
