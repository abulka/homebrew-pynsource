cask "pynsource" do
  version "pre-2026-dustoff-3"
  sha256 "f674c70d9b5ea3a1dd603be88f71d99dd39fe00a555ca47304811ca85de8227b"

  # NOTE: currently points at a pre-release asset because there is no versioned release of
  # the onedir rewrite yet. When the next `version-*` release is cut, switch to:
  #   version "1.86"
  #   url "https://github.com/abulka/pynsource/releases/download/version-#{version}/pynsource-macos-version-#{version}.zip"
  url "https://github.com/abulka/pynsource/releases/download/#{TAG}/pynsource-macos-#{TAG}.zip"
  name "Pynsource"
  desc "UML class diagram reverse engineering for Python"
  homepage "https://www.pynsource.com/"

  app "Pynsource.app"

  # Homebrew quarantines every cask download. For an app that is ad-hoc signed (no Apple
  # Developer ID) that means the user still has to find System Settings > Privacy & Security
  # and approve it. Undo the quarantine here so it just opens.
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

    Editing diagrams needs no licence; the Pro features (zoom, drag-to-connect, module
    visualisation) need a licence - see #{Formatter.url("https://www.pynsource.com/pricing.html")}.
  EOS
end
