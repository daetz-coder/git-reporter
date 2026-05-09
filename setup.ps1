# git-reporter - /report command installer
Write-Host "========================================" -ForegroundColor Cyan
Write-Host " git-reporter - /report command installer" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$commandsDir = "$env:USERPROFILE\.claude\commands"

if (!(Test-Path $commandsDir)) {
    New-Item -ItemType Directory -Path $commandsDir -Force | Out-Null
    Write-Host "[OK] Created ~/.claude/commands/" -ForegroundColor Green
}

Copy-Item ".claude\commands\report.md" "$commandsDir\report.md" -Force
Write-Host "[OK] Installed /report command to ~/.claude/commands/report.md" -ForegroundColor Green

Write-Host ""
Write-Host "Done! Restart Claude Code and use /report in any git repository." -ForegroundColor Yellow
