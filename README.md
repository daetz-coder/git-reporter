**English** | [中文](README_zh.md)

<div align="center">

# git-reporter

> *"Writing weekly reports is one of the most painful tasks for developers — this tool cuts the pain in half."*

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Skill-blueviolet)](https://claude.ai/code)

<br>

Every Friday afternoon, are you still scrolling through `git log` trying to remember what you did this week?<br>
Writing and rewriting your report, struggling with format and content?<br>
Team members' reports all look different, and summarizing them feels like translation work?<br>

**Let Claude automatically extract, analyze, and generate work reports from your git history!**

<br>

Supports daily / weekly / monthly reports · Multiple output modes<br>
Auto-reads reference docs to learn your style · Bilingual output · One-click install

[Installation](#installation) · [Usage](#usage) · [Reference Docs](#reference-docs-rag) · [Project Structure](#project-structure)

</div>

---

## Features

| Feature | Description |
| --- | --- |
| **Multiple Output Modes** | Generate reports with varying levels of detail |
| **Bilingual Support** | Chinese input → Chinese report, English input → English report |
| **Reference Doc Learning** | Drop in existing reports and it will mimic their structure and style |
| **Code Snippets** | Automatically extract representative code snippets from your repo |
| **Mermaid Diagrams** | Auto-generate architecture and flow diagrams |
| **Self-contained** | No external dependencies, no Python required |
| **Analyze Current Project** | `git log` runs in your current working directory |

---

## Installation

```bash
git clone https://github.com/daetz-coder/git-reporter.git
cd git-reporter

# Windows (PowerShell)
.\setup.ps1

# Linux / macOS
bash setup.sh
```

After installation, **restart Claude Code**. The `/report` command will be available in all git repositories.

---

## Usage

Navigate to your project directory and run in Claude Code:

```bash
cd /path/to/your-project
/report generate this week's report
```

### More Examples

```bash
# Weekly reports
/report generate this week's report
/report generate last week's report

# Monthly reports
/report generate this month's report
/report generate last month's report

# Specify users
/report generate weekly report for John
/report generate monthly report for John and Jane

# Custom date range
/report generate report from 2026-05-01 to 2026-05-09

# 中文
/report 生成本周周报
/report 生成上月月报
```

---

## Reference Docs (RAG)

Create a `references/` folder in **your project's** root directory and add existing report files (.md format):

```
your-project/
├── src/
├── references/                 # ← Create this in your project
│   ├── last-week-report.md
│   ├── april-report.md
│   └── team-report-template.md
├── ...
└── .git
```

When generating reports, it will automatically read these documents and learn their:
- Section structure
- Formatting style (table / list / diagram preferences)
- Tone and word choice
- Content depth

> The `references/` directory should be in **the project you want to generate reports for**, not in git-reporter itself.

---

## Project Structure

```
git-reporter/                   # Tool installer (clone and run setup)
├── .claude/
│   ├── commands/
│   │   └── report.md           # /report slash command definition
│   └── settings.local.json     # Permission config
├── setup.ps1                   # Windows setup script
├── setup.sh                    # Linux/Mac setup script
├── README.md                   # This file
└── .gitignore
```

---

## How It Works

1. **Parse Intent**: Extract report type, date range, user, and language from user input
2. **Learn from References**: Read documents in the current project's `references/` folder and analyze their style
3. **Collect Data**: Run `git log` to get commit history and file change details from the current project
4. **Deep Analysis**: Read actual source code files in the repo to understand code logic
5. **Generate Report**: Claude analyzes the data and generates the report content
6. **Write Output**: Save to the current project's `output/` directory

---

<div align="center">

MIT License

</div>
