# homebrew-engx

Homebrew tap for the [Nexus Developer Platform](https://github.com/Harshmaury/Nexus) CLI.

## Install

```bash
brew tap harshmaury/engx
brew install engx
```

Or in one command:

```bash
brew install harshmaury/engx/engx
```

## What gets installed

| Binary | Purpose |
|--------|---------|
| `engx` | CLI — manage services, run workflows, observe the platform |
| `engxd` | Daemon — the platform control plane (start with `engx platform install`) |
| `engxa` | Remote agent — connect machines to the platform |

## Quick start

```bash
# Register engxd as a system service (auto-starts at login)
engx platform install

# Check platform health
engx doctor

# View all services
engx status
```

## Upgrade

```bash
engx upgrade        # self-update from GitHub Releases
# or
brew upgrade engx
```

## Uninstall

```bash
engx platform uninstall
brew uninstall engx
```
