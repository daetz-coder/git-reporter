#!/bin/bash
echo "========================================"
echo " git-reporter - /report command installer"
echo "========================================"
echo ""

mkdir -p ~/.claude/commands
cp .claude/commands/report.md ~/.claude/commands/report.md
echo "[OK] Installed /report command to ~/.claude/commands/report.md"

echo ""
echo "Done! Restart Claude Code and use /report in any git repository."
