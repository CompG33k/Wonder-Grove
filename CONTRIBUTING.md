# Contributing to Wonder Grove

Thank you for your interest in contributing to Wonder Grove.

Wonder Grove is an educational exploration game designed to encourage curiosity,
creativity, patience, and problem-solving through open-ended play.

## Project Management

Wonder Grove uses OpenProject to organize development work.

Development is organized using:

- Epics
- Features
- Tasks

Changes should be associated with an OpenProject work package before development
begins.

Each pull request should reference the corresponding OpenProject work package.

Example:

`OP#77`

## Branching Strategy

Wonder Grove uses a structured Git branching workflow.

### Main Branches

- `main` — stable project history and releases
- `develop` — integration branch for completed development work
- `release` — release preparation when required

Normal development should not be performed directly on these branches.

### Working Branches

Create a branch from `develop` for each OpenProject work package.

Branch names should include the work package type, OpenProject number, and a
short description.

Example:

`task/77-create-contributing-md`

Additional examples:

- `feature/100-player-interaction`
- `task/101-add-interaction-component`
- `bugfix/102-fix-object-collision`

Keep branch names lowercase and use hyphens between words.

## Development Workflow

Before beginning work, update your local `develop` branch:

```bash
git switch develop
git pull origin develop

Create the working branch:

git switch -c task/<work-package-number>-<description>

Make only the changes required by the associated OpenProject work package.

Commit Messages

Commit messages should clearly describe the change and reference the associated
OpenProject work package.

Example:

[#77] Add CONTRIBUTING.md

Keep commits focused and avoid including unrelated changes.

Pull Requests

Completed work should be submitted through a pull request.

For normal development:

working branch → develop

Do not merge normal task or feature branches directly into main.

Pull requests should:

Reference the associated OpenProject work package
Clearly summarize the change
Include acceptance criteria
Contain only changes related to the work package
Include testing or manual verification information when applicable
Include screenshots when visual changes are involved

Use the repository pull request template when creating a pull request.

Review Checklist

Before merging a pull request, verify that:

Code follows project conventions
Changes are scoped to the linked OpenProject work package
No unrelated files or changes are included
Tests or manual verification have been completed
Documentation has been updated when needed
The pull request title and OpenProject reference are correct
No secrets, credentials, or environment-specific values are committed
Merge Strategy

Pull requests should be reviewed before being merged.

Wonder Grove uses squash merging for completed task and feature branches.

Completed development work is normally merged into develop.

Stable, verified development can later be promoted from develop toward the
project's release process and main.

Delete completed working branches after they have been successfully merged.

Documentation

Project documentation is maintained in the repository.

Repository-level contributor documentation includes:

README.md
CONTRIBUTING.md
CODE_OF_CONDUCT.md

Technical development documentation belongs under:

docs/Engineering/

Game and product design documentation belongs under:

docs/Design/

Update documentation whenever a change affects documented behavior, development
processes, architecture, or contributor expectations.

Code of Conduct

All contributors are expected to follow the standards defined in
CODE_OF_CONDUCT.md.

Questions and Changes to the Process

The development workflow will evolve as Wonder Grove grows.

Changes to repository conventions, branching strategy, pull request rules, or
other development processes should be documented and tracked through an
appropriate OpenProject work package.


So your repository will eventually look roughly like:

```text
Wonder-Grove/
├── .github/
│   └── PULL_REQUEST_TEMPLATE.md
│
├── docs/
│   ├── Design/
│   └── Engineering/
│       ├── DEVELOPMENT.md       ← #78 later
│       └── GIT_WORKFLOW.md      ← #79 later
│
├── CODE_OF_CONDUCT.md           ← #80 DONE
├── CONTRIBUTING.md              ← #77 YOU ARE HERE
└── README.md

For #77, just create the single CONTRIBUTING.md file at the root and paste the Markdown above. Don't create DEVELOPMENT.md or GIT_WORKFLOW.md yet — those belong to their own OpenProject tasks.