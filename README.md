# homebrew-raum

Homebrew tap for [raum](https://github.com/andremonaco/raum) — a
lightning-fast, recoverable terminal orchestrator for AI agent harnesses.

## Install

```sh
brew install --cask andremonaco/raum/raum
```

That single command taps this repo and installs the signed `.app` bundle.
`brew upgrade` picks up new releases automatically.

## Uninstall

```sh
brew uninstall --cask raum
brew untap andremonaco/raum   # optional
```

## Updates

raum ships with an in-app updater (Settings → Updates) that pulls signed
bundles directly from GitHub Releases. You do not need `brew upgrade` to
stay current — but `brew upgrade raum` also works if you prefer.

## How this tap is maintained

The canonical Cask template lives in the raum repo at
[`packaging/homebrew/Casks/raum.rb`](https://github.com/andremonaco/raum/tree/main/packaging/homebrew/Casks/raum.rb).
Each time a release is cut, a GitHub Actions job in the raum repo:

1. Downloads the newly-published `.dmg` bundles for arm64 and x86_64.
2. Computes their sha256 digests.
3. Opens a PR against this repo with the version + hashes patched in.

Review and merge the PR; no manual updates needed.
