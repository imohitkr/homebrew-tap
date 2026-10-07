cask "colima-bar" do
  version "0.4.0"
  sha256 "ba09f0f4636eb85e19ee323dfc34e4aeb96265fb62e841f6a6d3cf16b842af8e"

  url "https://github.com/imohitkr/colima-bar/releases/download/v#{version}/ColimaBar.zip"
  name "ColimaBar"
  desc "Menu bar dashboard for Colima that starts the VM on demand"
  homepage "https://github.com/imohitkr/colima-bar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "ColimaBar.app"

  # `brew upgrade` also runs the uninstall directives. An upgrade must keep
  # the login item (com.imohitkr.ColimaBar.login), so `zap` removes it.
  uninstall launchctl: "com.imohitkr.ColimaBar.agent",
            quit:      "com.imohitkr.ColimaBar"

  zap launchctl: "com.imohitkr.ColimaBar.login",
      delete:    "~/Library/LaunchAgents/com.imohitkr.ColimaBar.login.plist",
      trash:     "~/Library/Preferences/com.imohitkr.ColimaBar.plist"

  caveats <<~EOS
    Apple does not notarize ColimaBar. Thus macOS blocks the first launch
    after you install or upgrade it. To allow ColimaBar, open
    System Settings > Privacy & Security and click "Open Anyway". Or run:
      xattr -dr com.apple.quarantine /Applications/ColimaBar.app

    `brew uninstall` cannot restore your docker settings (docker context,
    launchd DOCKER_HOST, testcontainers). Before you run `brew uninstall`,
    choose "Uninstall ColimaBar…" in the right-click menu of ColimaBar.
    If your version does not have that menu item, run this script:
      /Applications/ColimaBar.app/Contents/Resources/uninstall.sh
  EOS
end
