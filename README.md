# dtolb/homebrew-tap

Homebrew tap for dtolb tools.

## Dropper CLI

```bash
brew install --cask dtolb/tap/dropper
dropper --version
```

The cask installs the `dropper` command-line client for [dropp.sh](https://dropp.sh) — drop a
static page, get a URL. Install notes, a `curl | sh` installer for macOS and Linux, and direct
downloads with checksums live at <https://dropp.sh/docs/cli>.

`Casks/dropper.rb` is written by the Dropper release pipeline after each production release; it
is not edited by hand.
