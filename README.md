# homebrew-pynsource

Homebrew cask for [Pynsource](https://www.pynsource.com/) — a UML class diagram
reverse-engineering tool for Python.

```bash
brew install --cask abulka/pynsource/pynsource
# or
brew tap abulka/pynsource && brew install --cask pynsource
```

Upgrade with `brew upgrade --cask pynsource`, remove with `brew uninstall --cask pynsource`
(add `--zap` to also remove preferences and logs).

The app is ad-hoc signed (no paid Apple Developer ID), so the cask clears the quarantine flag
during install — otherwise macOS would make you approve it in System Settings first.

Source: <https://github.com/abulka/pynsource>
