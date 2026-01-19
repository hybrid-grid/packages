# Hybrid-Grid Packages

Official package distribution for [Hybrid-Grid Build](https://github.com/hybrid-grid/hybridgrid) - a distributed multi-platform build system.

## Quick Install

### Linux / macOS (Install Script)

```bash
curl -fsSL https://raw.githubusercontent.com/hybrid-grid/homebrew-packages/main/install.sh | bash
```

**Options:**
```bash
# Install specific version
VERSION=0.1.0 curl -fsSL https://raw.githubusercontent.com/hybrid-grid/homebrew-packages/main/install.sh | bash

# Install to custom directory (no sudo required)
INSTALL_DIR=~/.local/bin curl -fsSL https://raw.githubusercontent.com/hybrid-grid/homebrew-packages/main/install.sh | bash
```

### macOS / Linux (Homebrew)

```bash
brew tap hybrid-grid/packages
brew install hybridgrid
```

### Windows (Scoop)

```powershell
scoop bucket add hybridgrid https://github.com/hybrid-grid/homebrew-packages
scoop install hybridgrid
```

### Manual Download

Download pre-built binaries from [GitHub Releases](https://github.com/hybrid-grid/hybridgrid/releases).

## Installation Summary

| Platform | Method | Command |
|----------|--------|---------|
| Linux | Install script | `curl -fsSL .../install.sh \| bash` |
| Linux | Homebrew | `brew install hybrid-grid/packages/hybridgrid` |
| macOS | Homebrew | `brew install hybrid-grid/packages/hybridgrid` |
| macOS | Install script | `curl -fsSL .../install.sh \| bash` |
| Windows | Scoop | `scoop bucket add hybridgrid ...; scoop install hybridgrid` |
| Any | Manual | Download from GitHub releases |

## What's Included

All installation methods provide:

| Binary | Description |
|--------|-------------|
| `hgbuild` | CLI client for the Hybrid-Grid Build system |
| `hg-coord` | Coordinator server for managing build workers |
| `hg-worker` | Worker agent for executing builds |

## Updating

### Homebrew
```bash
brew update
brew upgrade hybridgrid
```

### Scoop
```powershell
scoop update hybridgrid
```

### Install Script
```bash
# Re-run with new version
VERSION=x.y.z curl -fsSL https://raw.githubusercontent.com/hybrid-grid/homebrew-packages/main/install.sh | bash
```

## Uninstalling

### Homebrew
```bash
brew uninstall hybridgrid
brew untap hybrid-grid/packages
```

### Scoop
```powershell
scoop uninstall hybridgrid
scoop bucket rm hybridgrid
```

### Install Script
```bash
sudo rm /usr/local/bin/{hgbuild,hg-coord,hg-worker}
```

## License

MIT License - see [hybridgrid LICENSE](https://github.com/hybrid-grid/hybridgrid/blob/main/LICENSE)
