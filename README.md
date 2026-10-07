# Homebrew tap for ColimaBar

This tap contains the Homebrew cask for [ColimaBar](https://github.com/imohitkr/colima-bar). ColimaBar is a macOS menu bar dashboard for [Colima](https://github.com/abiosoft/colima) that starts the VM on demand.

You need a Mac with Apple silicon and macOS 14 or later.

## Install

```sh
brew install --cask imohitkr/tap/colima-bar
```

Apple does not notarize ColimaBar. Thus macOS blocks the first launch after you install or upgrade it. To allow ColimaBar, open **System Settings > Privacy & Security** and click **Open Anyway**. As an alternative, run this command:

```sh
xattr -dr com.apple.quarantine /Applications/ColimaBar.app
```

## Upgrade

```sh
brew upgrade --cask colima-bar
```

A workflow in this repository checks for a new ColimaBar release every 6 hours. Before it updates the cask, it verifies the build provenance attestation of `ColimaBar.zip`.

## Uninstall

`brew uninstall` cannot restore your docker settings. Do these steps in this order:

1. Right-click the ColimaBar menu bar icon and choose **Uninstall ColimaBar…**. If your version does not have this menu item, run `/Applications/ColimaBar.app/Contents/Resources/uninstall.sh`.
2. Run `brew uninstall --cask colima-bar`.

The first step restores the docker context. It removes the `colimabar` context and the `colimabar-PROFILE` contexts that ColimaBar made. It also clears the launchd `DOCKER_HOST` and the testcontainers settings, and removes the app. The second step removes the Homebrew record of the cask.

## Problems

Report ColimaBar problems in the [ColimaBar issue tracker](https://github.com/imohitkr/colima-bar/issues).

## License

[MIT](LICENSE)
