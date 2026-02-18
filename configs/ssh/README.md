# SSH Config

`config` is symlinked to `~/.ssh/config`.

`id_ed25519.pub` is the public key for this machine (MacBook 2026).
The **private key is never stored here** — generate a new one per machine.

## New Machine SSH Setup

```bash
# 1. Generate a new key
ssh-keygen -t ed25519 -C "github@halitdincer.com" -f ~/.ssh/id_ed25519 -N ""

# 2. Add to GitHub via gh CLI
gh ssh-key add ~/.ssh/id_ed25519.pub --title "Machine Name Year"

# 3. Test
ssh -T git@github.com
```
