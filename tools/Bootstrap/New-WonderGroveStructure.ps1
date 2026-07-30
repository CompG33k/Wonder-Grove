# Creates the initial Wonder Grove repository structure.
# Safe to run more than once: existing folders and files are preserved.

$ErrorActionPreference = "Stop"

#$repoName = "WonderGrove"
#$repoPath = Join-Path -Path (Get-Location) -ChildPath $repoName

# Run this script from the root of the cloned Wonder-Grove repository.
$repoPath = Get-Location

if ((Split-Path $repoPath -Leaf) -ne "Wonder-Grove") {
    Write-Host ""
    Write-Host "ERROR: Please run this script from the root of the Wonder-Grove repository." -ForegroundColor Red
    Write-Host ""
    Write-Host "Current folder:"
    Write-Host "  $repoPath"
    Write-Host ""
    Write-Host "Expected:"
    Write-Host "  ...\Wonder-Grove"
    exit 1
}

$directories = @(
    ".github\ISSUE_TEMPLATE",
    ".github\workflows",

    "docs\Product",
    "docs\Design",
    "docs\Engineering",
    "docs\Project",
    "docs\Research",

    "game\WonderGrove.Unity",

    "backend\WonderGrove.Api",
    "website\WonderGrove.Web",

    "tools\AssetPipeline",
    "tools\Localization",
    "tools\Utilities",

    "assets\Concepts",
    "assets\Characters",
    "assets\Logos",
    "assets\Mockups",
    "assets\References",
    "assets\Marketing"
)

$files = @{
    ".github\ISSUE_TEMPLATE\bug_report.md" = @"
---
name: Bug report
about: Report a reproducible problem
title: "bug: "
labels: bug
assignees: ""
---

## Description

## Steps to reproduce

1.
2.
3.

## Expected behavior

## Actual behavior

## Environment

- Platform:
- Unity version:
- Build/version:
"@

    ".github\ISSUE_TEMPLATE\feature_request.md" = @"
---
name: Feature request
about: Suggest a product or gameplay improvement
title: "feat: "
labels: enhancement
assignees: ""
---

## Summary

## User value

## Proposed behavior

## Acceptance criteria

- [ ]
- [ ]
"@

    ".github\ISSUE_TEMPLATE\task.md" = @"
---
name: Task
about: Track product, design, engineering, or documentation work
title: "task: "
labels: task
assignees: ""
---

## Objective

## Deliverables

- [ ]
- [ ]

## Definition of done

- [ ]
"@

    ".github\PULL_REQUEST_TEMPLATE.md" = @"
## Summary

## Related issue

Closes #

## Changes

- 
- 

## Testing

- [ ] Tests added or updated
- [ ] Manual testing completed
- [ ] Documentation updated

## Screenshots

Not applicable.
"@

    ".github\workflows\README.md" = @"
# GitHub Actions

Continuous integration workflows will be added when the Unity project and other applications are initialized.
"@

    "docs\Product\Vision.md" = "# Product Vision`r`n"
    "docs\Product\Mission.md" = "# Mission`r`n"
    "docs\Product\ProductRequirementsDocument.md" = "# Product Requirements Document`r`n"
    "docs\Product\EducationalPhilosophy.md" = "# Educational Philosophy`r`n"
    "docs\Product\CompetitiveAnalysis.md" = "# Competitive Analysis`r`n"
    "docs\Product\Roadmap.md" = "# Product Roadmap`r`n"
    "docs\Product\BusinessModel.md" = "# Business Model`r`n"
    "docs\Product\SuccessMetrics.md" = "# Success Metrics`r`n"
    "docs\Product\RiskRegister.md" = "# Risk Register`r`n"

    "docs\Design\CharacterBible.md" = "# Character Bible`r`n"
    "docs\Design\WorldBible.md" = "# World Bible`r`n"
    "docs\Design\GameplayLoop.md" = "# Gameplay Loop`r`n"
    "docs\Design\InteractionSystem.md" = "# Interaction System`r`n"
    "docs\Design\EducationalSystems.md" = "# Educational Systems`r`n"
    "docs\Design\ArtDirection.md" = "# Art Direction`r`n"
    "docs\Design\AudioStyleGuide.md" = "# Audio Style Guide`r`n"
    "docs\Design\AnimationGuide.md" = "# Animation Guide`r`n"
    "docs\Design\UIUXGuide.md" = "# UI and UX Guide`r`n"

    "docs\Engineering\Architecture.md" = "# Software Architecture`r`n"
    "docs\Engineering\UnityProjectStructure.md" = "# Unity Project Structure`r`n"
    "docs\Engineering\CodingStandards.md" = "# Coding Standards`r`n"
    "docs\Engineering\EventSystem.md" = "# Event System`r`n"
    "docs\Engineering\ObjectEngine.md" = "# Object Engine`r`n"
    "docs\Engineering\SaveSystem.md" = "# Save System`r`n"
    "docs\Engineering\DatabaseDesign.md" = "# Database Design`r`n"
    "docs\Engineering\APISpecification.md" = "# API Specification`r`n"
    "docs\Engineering\Localization.md" = "# Localization`r`n"
    "docs\Engineering\TestingStrategy.md" = "# Testing Strategy`r`n"

    "docs\Project\PROJECT_GUIDE.md" = @"
# Wonder Grove Project Guide

## Project management

Odoo tracks high-level planning, tasks, milestones, and progress.

## Source control

GitHub stores code, documentation, issues, pull requests, and architecture decisions.

## Current status

Pre-production.
"@

    "docs\Project\CHANGELOG.md" = @"
# Changelog

All notable project changes will be documented here.
"@

    "docs\Project\DECISIONS.md" = @"
# Project Decisions

Record significant product, design, and engineering decisions here.

## Decision template

### Decision

### Context

### Options considered

### Outcome

### Consequences
"@

    "docs\Project\Glossary.md" = "# Glossary`r`n"
    "docs\Project\Milestones.md" = "# Milestones`r`n"

    "docs\Research\EducationalGames.md" = "# Educational Games Research`r`n"
    "docs\Research\ChildDevelopment.md" = "# Child Development Research`r`n"
    "docs\Research\Accessibility.md" = "# Accessibility Research`r`n"
    "docs\Research\Inspiration.md" = "# Inspiration and References`r`n"

    "backend\README.md" = @"
# Wonder Grove Backend

Planned ASP.NET Core services for optional cloud saves, parent features, localization, and privacy-conscious analytics.
"@

    "website\README.md" = @"
# Wonder Grove Website

Planned public website and product information.
"@

    "tools\README.md" = @"
# Wonder Grove Tools

Internal utilities for asset processing, localization, automation, and development support.
"@

    "game\WonderGrove.Unity\README.md" = @"
# Wonder Grove Unity Project

The Unity project will be created in this directory.
"@

    ".editorconfig" = @"
root = true

[*]
charset = utf-8
end_of_line = crlf
insert_final_newline = true
trim_trailing_whitespace = true

[*.md]
trim_trailing_whitespace = false

[*.cs]
indent_style = space
indent_size = 4
"@

    "README.md" = @"
# Wonder Grove

Wonder Grove is an original educational exploration game for children ages 2–8. It encourages curiosity, creativity, patience, hand-eye coordination, early STEM learning, and problem-solving through open-ended play without scores, timers, or game-over screens.

## Status

Pre-production

## Current milestone

Product definition

## Planned technology

- Unity
- C#
- ASP.NET Core
- PostgreSQL

## Repository structure

- ``docs/Product`` — product strategy and requirements
- ``docs/Design`` — game and educational design
- ``docs/Engineering`` — architecture and technical specifications
- ``docs/Project`` — conventions, decisions, milestones, and changes
- ``docs/Research`` — supporting research
- ``game`` — Unity client
- ``backend`` — future ASP.NET Core services
- ``website`` — future public website
- ``tools`` — internal development utilities
- ``assets`` — concepts, mockups, references, and marketing assets
"@
}

Write-Host "Creating repository structure at: $repoPath" -ForegroundColor Cyan

New-Item -ItemType Directory -Path $repoPath -Force | Out-Null

foreach ($directory in $directories) {
    $fullPath = Join-Path $repoPath $directory
    New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
}

foreach ($relativePath in $files.Keys) {
    $fullPath = Join-Path $repoPath $relativePath
    $parent = Split-Path $fullPath -Parent

    New-Item -ItemType Directory -Path $parent -Force | Out-Null

    if (-not (Test-Path $fullPath)) {
        Set-Content -Path $fullPath -Value $files[$relativePath] -Encoding utf8
    }
    else {
        Write-Host "Preserved existing file: $relativePath" -ForegroundColor DarkGray
    }
}

# Git does not track empty directories, so add placeholders where needed.
$placeholderFolders = @(
    "assets\Concepts",
    "assets\Characters",
    "assets\Logos",
    "assets\Mockups",
    "assets\References",
    "assets\Marketing",
    "tools\AssetPipeline",
    "tools\Localization",
    "tools\Utilities"
)

foreach ($folder in $placeholderFolders) {
    $gitKeep = Join-Path $repoPath "$folder\.gitkeep"

    if (-not (Test-Path $gitKeep)) {
        New-Item -ItemType File -Path $gitKeep -Force | Out-Null
    }
}

Write-Host ""
Write-Host "Wonder Grove structure created successfully." -ForegroundColor Green
Write-Host "Next:" -ForegroundColor Yellow
Write-Host "  cd `"$repoPath`""
Write-Host "  git status"
Write-Host "  git add ."
Write-Host '  git commit -m "chore: establish initial repository structure"'
Write-Host "  git push"