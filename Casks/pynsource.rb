cask "pynsource" do
  version "2026.11.3"
  sha256 "f674c70d9b5ea3a1dd603be88f71d99dd39fe00a555ca47304811ca85de8227b"

  # NOTE: points at a pre-release asset for now because there is no versioned release of the
  # onedir rewrite yet. At the next `version-*` release switch these two lines to:
  #   version "1.86"
  #   url "https://github.com/abulka/pynsource/releases/download/version-#{version}/pynsource-macos-version-#{version}.zip"
  url "https://github.com/abulka/pynsource/releases/download/pre-2026-dustoff-3/pynsource-macos-pre-2026-dustoff-3.zip"
  name "Pynsource"
  desc "UML class diagram reverse engineering for Python"
  homepage "https://www.pynsource.com/"

  app "Pynsource.app"

  # Homebrew quarantines every cask download. For an app that is ad-hoc signed (no paid Apple
  # Developer ID) that means the user still has to hunt through System Settings > Privacy &
  # Security and approve it. Undo the quarantine here so it just opens.
  # NOTE: `postflight` is deprecated in Homebrew 7 in favour of `postflight_steps`, but that
  # declarative API does not expose `appdir` yet; keep this until it does.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Pynsource.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/PyNsource",
    "~/Library/Preferences/Pynsource",
    "~/Library/Logs/pynsource",
  ]

  caveats <<~EOS
    Pynsource is ad-hoc signed (no paid Apple Developer ID), so macOS cannot verify it.
    This cask clears the quarantine flag during install, so it should open with no
    Gatekeeper prompt.

    Viewing and editing diagrams needs no licence. The Pro features (zoom,
    drag-to-connect, module visualisation) need a licence:
    https://www.pynsource.com/pricing.html

    Note: "brew info pynsource" and "brew upgrade --cask pynsource" (WITHOUT the
    abulka/pynsource/ prefix) refer to Homebrew's own old 1.84 cask, which is disabled
    because it is an Intel build that fails the macOS Gatekeeper check. This cask is
    arm64 and is installed prompt-free. Always use the tap-qualified name, or just run
    "brew upgrade" with no arguments.
  EOS
end
