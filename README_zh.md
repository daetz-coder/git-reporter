[English](README.md) | **中文**

<div align="center">

# git-reporter

> *"写周报是程序员最痛苦的事之一 — 有了它，痛苦减半"*

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Skill-blueviolet)](https://claude.ai/code)

<br>

每周五下午，你是否还在对着 git log 一条条回忆这周干了啥？<br>
汇报文档写了删、删了写，格式对不上、内容太单薄？<br>
团队成员的周报风格各异，汇总起来像在做翻译？<br>

**让 Claude 帮你从 git 历史中自动提取、分析、生成工作汇报！**

<br>

支持日报 / 周报 / 月报 · 多种输出模式<br>
自动读取参考文档学习风格 · 双语输出 · 一键安装

[安装](#安装) · [使用](#使用) · [参考文档](#参考文档rag) · [项目结构](#项目结构)

</div>

---

## 功能特性

| 特性             | 说明                                               |
| ---------------- | -------------------------------------------------- |
| **多种输出模式** | 根据需求生成不同详细程度的报告                     |
| **双语支持**     | 中文提问→中文报告，English input→English report    |
| **参考文档学习** | 放入已有汇报文档，自动模仿其结构和风格             |
| **代码片段**     | 自动从仓库中提取代表性代码片段                     |
| **Mermaid 图表** | 自动生成架构图、流程图辅助说明                     |
| **自包含**       | 无外部依赖，不需要 Python                          |
| **分析当前项目** | `git log` 在当前工作目录执行，分析你正在开发的项目 |

---

## 安装

```bash
git clone https://github.com/daetz-coder/git-reporter.git
cd git-reporter

# Windows (PowerShell)
.\setup.ps1

# Linux / macOS
bash setup.sh
```

安装后**重启 Claude Code**，`/report` 命令在所有 git 仓库中可用。

---

## 使用

进入你的项目目录，在 Claude Code 中输入：

```bash
cd /path/to/your-project
/report 生成本周周报
```

### 更多示例

```bash
# 周报
/report 生成本周周报
/report 生成上周周报

# 月报
/report 生成本月月报
/report 生成上月月报

# 指定用户
/report 生成张三的本周周报
/report 生成张三和李四的本月月报

# 自定义日期
/report 生成2026-05-01到2026-05-09的报告

# English
/report generate this week's report
/report generate weekly report for last week
```

---

## 参考文档（RAG）

在**你的项目**根目录下创建 `references/` 文件夹，放入已有的汇报文档（.md 格式）：

```
your-project/
├── src/
├── references/                 # ← 在你的项目中创建
│   ├── 上周周报.md
│   ├── 4月月报.md
│   └── 团队汇报模板.md
├── ...
└── .git
```

生成报告时会自动读取这些文档，学习其：
- 章节划分方式
- 排版风格（表格/列表/图表偏好）
- 用词习惯和语气
- 内容深度

> `references/` 目录放在**需要生成报告的项目**中，不是放在 git-reporter 中。

---

## 项目结构

```
git-reporter/                   # 工具安装器（克隆后运行 setup 即可）
├── .claude/
│   ├── commands/
│   │   └── report.md           # /report 斜杠命令定义
│   └── settings.local.json     # 权限配置
├── setup.ps1                   # Windows 安装脚本
├── setup.sh                    # Linux/Mac 安装脚本
├── README.md                   # 英文文档
├── README_zh.md                # 中文文档（本文件）
└── .gitignore
```

---

## 工作原理

1. **解析意图**：从用户输入中提取报告类型、日期范围、用户、语言
2. **参考文档学习**：读取当前项目 `references/` 中的文档，分析风格
3. **收集数据**：执行 `git log` 获取当前项目的 commit 记录和文件变更详情
4. **深度分析**：读取仓库中的实际源代码文件，理解代码逻辑
5. **生成报告**：Claude 分析数据，生成报告内容
6. **写入文件**：输出到当前项目的 `output/` 目录

---

<div align="center">

MIT License

</div>
