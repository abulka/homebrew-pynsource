# homebrew-pynsource

Homebrew cask for [Pynsource](https://www.pynsource.com/) — a UML class diagram
reverse-engineering tool for Python.

```bash
brew install --cask abulka/pynsource/pynsource
# or
brew tap abulka/pynsource && brew install --cask pynsource
```

Upgrade with `brew upgrade` (no arguments) or `brew upgrade --cask abulka/pynsource/pynsource`.
Remove with `brew uninstall --cask pynsource` (add `--zap` to also remove preferences/logs).

## Why `brew info pynsource` looks alarming

There are **two** casks called `pynsource`:

| cask | version | state |
|---|---|---|
| `pynsource` (Homebrew's own tap) | 1.84 | **disabled** since 2026-09-01: Intel build that fails the macOS Gatekeeper check |
| `abulka/pynsource/pynsource` (this tap) | current | arm64, onedir, installs prompt-free |

So `brew info pynsource` prints a red `(disabled)`, a version "2026.11.4 → 1.84" and an
"built for Intel macOS / needs Rosetta 2" caveat — all of that describes Homebrew's old 1.84
cask, not this one. Likewise `brew upgrade --cask pynsource` (unqualified) refuses with
"Not upgrading pynsource, it is disabled…". Use the tap-qualified name, or plain
`brew upgrade`.

This app is **arm64 only** (Apple silicon). Intel Macs cannot run it — that is a separate
decision for the project, not something this cask can paper over.

## Gatekeeper

The app is ad-hoc signed (no paid Apple Developer ID), so Homebrew's quarantine of the
download would normally trigger the "Apple could not verify…" dialog. The cask removes the
quarantine flag in `postflight`, so it opens with no prompt.

Source: <https://github.com/abulka/pynsource>
