# Wonder Grove Development Guide

This guide describes the local development practices and engineering expectations
for the Wonder Grove project.

It is intended to help contributors understand how to prepare their environment,
work within the repository, verify changes, and keep development consistent.

## Development Principles

Wonder Grove development should prioritize:

- Clear and maintainable code
- Small, focused changes
- Traceability to OpenProject work packages
- Reviewable pull requests
- Consistent documentation
- Safe handling of configuration and credentials
- Verification before merging

## Project Management

Development work is tracked in OpenProject.

Work is organized using:

- Epics
- Features
- Tasks

Before beginning work:

1. Identify the appropriate OpenProject work package.
2. Move the work package to `In Progress`.
3. Create a Git branch associated with that work package.
4. Keep changes limited to the scope of that work package.

When a pull request is opened, move the work package to `Review`.

After the pull request is merged and the work is complete, move the work package
to `Done`.

## Repository Structure

The repository should keep project content organized by purpose.

Example structure:

```text
Wonder-Grove/
├── .github/
├── docs/
│   ├── Design/
│   └── Engineering/
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md

## docs/Design/

Contains game design, product design, gameplay concepts, user experience
documentation, and other design-focused material.

docs/Engineering/

Contains technical documentation such as:

Development procedures
Git workflow documentation
Architecture documentation
Build and deployment instructions
Technical decisions
Engineering standards
Local Development Environment

Before starting development, verify that the required development tools are
installed and functioning.

Current project tooling may include:

Git
GitHub
Docker Desktop
WSL2
OpenProject
Project-specific game development tooling

Additional tools may be added as the Wonder Grove implementation evolves.

Starting Development Work

Begin from the latest develop branch:

git switch develop
git pull origin develop

Verify the working tree:

git status

Create a branch associated with the OpenProject work package:

git switch -c task/<work-package-number>-<description>

Example:

git switch -c task/78-create-development-guide
Making Changes

Keep each branch focused on one OpenProject work package.

Avoid combining unrelated changes into the same branch or pull request.

Before committing:

git status
git diff

Review changes carefully and confirm that no unrelated files are included.

Configuration and Secrets

Do not commit:

Passwords
API keys
Access tokens
Private certificates
Personal credentials
Machine-specific secrets
Production configuration values

Environment-specific configuration should remain outside source control when
appropriate.

Use example configuration files when contributors need to understand required
settings without exposing real values.

Documentation

Documentation should be updated when changes affect:

Development procedures
Architecture
Repository conventions
Configuration
Build processes
Deployment processes
Contributor expectations

Repository-level documentation includes:

README.md
CONTRIBUTING.md
CODE_OF_CONDUCT.md

Engineering documentation belongs under:

docs/Engineering/

Design documentation belongs under:

docs/Design/
Code Quality

Code should be:

Readable
Maintainable
Appropriately documented
Consistent with existing project conventions
Focused on the requirements of the work package

Avoid unnecessary complexity.

Prefer clear implementations over clever solutions that are difficult to
maintain.

Testing and Verification

Changes should be verified before a pull request is merged.

Depending on the type of work, verification may include:

Automated tests
Build verification
Manual testing
Documentation review
Visual verification
Integration testing

The pull request should state how the change was verified.

Pull Requests

Normal development work should be submitted through a pull request targeting
develop.

A pull request should include:

OpenProject work package reference
Summary of the change
Acceptance criteria
Testing or verification notes
Screenshots when applicable
Completed review checklist

Changes should remain limited to the linked work package.

Code Review

Before merging, verify that:

The implementation matches the work package requirements
Changes follow project conventions
No unrelated files are included
Testing or manual verification has been completed
Documentation has been updated when required
No secrets or environment-specific values are committed

Required corrections should be made on the same branch and pushed to update the
existing pull request.

Merge Strategy

Completed task and feature branches are normally squash merged into develop.

The general development flow is:

OpenProject work package
        ↓
working branch
        ↓
pull request
        ↓
review
        ↓
develop

Stable development is later promoted through the project release process toward
main.

For detailed Git procedures, see:

GIT_WORKFLOW.md

Branch Cleanup

After a pull request has been merged:

git switch develop
git pull origin develop

Then remove the completed local working branch when appropriate.

Because Wonder Grove uses squash merging, Git may require force deletion of the
local branch after the merge has been verified:

git branch -D task/<work-package-number>-<description>
Engineering Documentation

As Wonder Grove grows, this directory may include additional documents covering:

Architecture
Coding standards
Build instructions
Testing strategy
CI/CD
Deployment
Asset pipelines
Performance
Logging and diagnostics

These documents should be added through tracked OpenProject work packages rather
than as unrelated repository changes.

Related Documentation

See also:

../../CONTRIBUTING.md
GIT_WORKFLOW.md
../../CODE_OF_CONDUCT.md

After saving it, run:

```bash
git status