# homebrew-engx

Homebrew tap for [engx](https://github.com/Harshmaury/Nexus) — a local-first
developer control plane for multi-service development.

## Install

```bash
brew install harshmaury/engx/engx
```

Or tap first if you prefer:

```bash
brew tap harshmaury/engx
brew install engx
```

This installs three binaries:

| Binary | Role |
|--------|------|
| `engx` | CLI — everything you interact with directly |
| `engxd` | Daemon — runs in the background, manages your services |
| `engxa` | Agent — connects remote machines to the same platform |

## Quick Start

```bash
# Register engxd as a system service (auto-starts at login)
engx platform install

# Register your project
engx init

# Start and confirm it's running
engx run <project>

# Check platform health
engx doctor
```

## Upgrade

```bash
brew upgrade engx
```

Or use the built-in upgrade command (fetches directly from GitHub Releases):

```bash
engx upgrade
```

## What Is engx

engx manages your local development services — starting them, monitoring them,
recovering them when they fail, and giving you a clear picture of what's
happening across all of them at once.

Four commands cover 90% of usage:

```bash
engx run <project>    # does it work?
engx ps <project>     # what is the status?
engx logs <service>   # what happened?
engx doctor           # what is wrong with the platform?
```

**Local-first.** Everything runs on 127.0.0.1. No cloud dependency. Your data
does not leave your machine.

Full documentation: [github.com/Harshmaury/Nexus](https://github.com/Harshmaury/Nexus)

## Source

Formula: [Formula/engx.rb](Formula/engx.rb)  
Platform: [github.com/Harshmaury/Nexus](https://github.com/Harshmaury/Nexus)
