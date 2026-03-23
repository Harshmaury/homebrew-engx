# homebrew-engx

Homebrew tap for [engx](https://engx.dev) — local runtime platform for multi-service development.

## Install

```bash
brew tap harshmaury/engx
brew install harshmaury/engx/engx
```

## What this installs

| Binary | Role |
|--------|------|
| `engx`  | CLI — everything you interact with directly |
| `engxd` | Daemon — runs in the background, manages your services |
| `engxa` | Agent — connects remote machines to the same platform |

## Quick start

```bash
cd <your-project>
engx init                  # detect project + write nexus.yaml
engx run <your-project>    # start it
engx ps                    # see what is running
engx doctor                # full health check
```

## Update

```bash
brew upgrade harshmaury/engx/engx
```

## Alternative install

```bash
curl -fsSL https://get.engx.dev/install.sh | bash
```

## Source

[github.com/Harshmaury/Nexus](https://github.com/Harshmaury/Nexus)
