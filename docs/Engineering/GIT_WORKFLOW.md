# Wonder Grove Git Workflow

This document defines the Git development workflow used by the Wonder Grove
project.

The goal of this workflow is to keep development traceable, reviewable, and
connected to work managed in OpenProject.

## 1. Workflow Overview

Wonder Grove development follows this general flow:

OpenProject work package
→ Working branch
→ Commits
→ Pull request
→ Review
→ Merge into `develop`
→ Verification
→ Release process
→ `main`

Each development change should be associated with an OpenProject work package.

---

## 2. Primary Branches

### `main`

`main` represents the stable project history.

Normal development should not be committed directly to `main`.

Changes reach `main` through the project's release and integration process
after they have been reviewed and verified in `develop`.

### `develop`

`develop` is the primary integration branch for ongoing development.

Completed task and feature branches are normally merged into `develop`
through pull requests.

New working branches should normally be created from the latest `develop`.

### `release`

`release` is reserved for release preparation when required.

It provides a place for final release-specific verification or stabilization
before changes are promoted to `main`.

---

## 3. OpenProject Integration

Development work is tracked in OpenProject using work packages such as:

- Epics
- Features
- Tasks

Before beginning development:

1. Identify the OpenProject work package.
2. Move the work package to `In Progress`.
3. Note the work package number.
4. Create a Git branch associated with that work package.

For example, OpenProject task `#79` uses:

`task/79-document-git-workflow`

The OpenProject work package number should remain visible throughout the Git
and pull request workflow.

---

## 4. Updating `develop`

Before creating a new working branch, update the local `develop` branch:

```bash
git switch develop
git pull origin develop