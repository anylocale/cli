# anylocale

The anylocale CLI: POSIX `sh` plus `curl`, nothing else. Vendor it into a
repo, or install it and run it from CI, an Xcode build phase or an agent's
shell.

Version 1.8.0.

## Install

```sh
brew install anylocale/tap/anylocale
curl -fsSL https://anylocale.com/install.sh | sh   # no Homebrew
```

## First pull

Create an API token with `read` scope under **Settings -> Integrations** in
your project, then:

```sh
export ANYLOCALE_TOKEN=cm_live_...
anylocale sync --project my-app --out-dir Sources/Resources
```

`sync` writes every locale and every string table as
`<code>.lproj/<Name>.strings`, plus `.stringsdict` where plurals exist.
`anylocale pull --format android-xml|json|next-intl|csv|xcstrings` writes one
file in one format instead.

## Environment

| Variable | Meaning |
| --- | --- |
| `ANYLOCALE_TOKEN` | API token, overrides any stored one |
| `ANYLOCALE_URL` | API host, default `https://anylocale.com` |
| `ANYLOCALE_CONFIG` | token store, default `~/.anylocale` |

`anylocale login` stores a token instead, per project or as a default.

Every command and every exit code: <https://anylocale.com/integrations>.
