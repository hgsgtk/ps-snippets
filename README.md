# ps_snippets
PowerShell script snippets

`*.ps1` files in this repository are PowerShell scripts.

## Getting started

You need to install PowerShell in your machine. If you're using macOS, you can install it via Homebrew:

```bash
brew install --cask powershell
```

See [Installing PowerShell on macOS by Microsoft](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-macos?view=powershell-7.2) for more information.

After installation, make sure you can run the PowerShell command `pwsh`.

```bash
$ pwsh --version
PowerShell 7.2.6
```

Start powershell interactive session:

```bash
$ pwsh -i
```

## Lint

To run PSScriptAnalyzer, you need to install the [PSScriptAnalyzer](https://docs.microsoft.com/en-us/powershell/utility-modules/psscriptanalyzer/overview?view=ps-modules#installing-psscriptanalyzer).

- Install the module:

```bash
PS > Install-Module -Name PSScriptAnalyzer -Force
```

- Run PSScriptAnalyzer:

```bash
PS > Invoke-ScriptAnalyzer -Path .
```