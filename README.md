# Homebrew Tap for Enzyme

This is the official Homebrew tap for [Enzyme](https://github.com/byenzyme/enzyme), an AI-powered knowledge management system for markdown vaults.

## Installation

```bash
brew tap byenzyme/enzyme
brew install enzyme
```

## Usage

After installation, you can use the `enzyme` command:

```bash
# Navigate to your markdown vault
cd /path/to/your/vault

# Start the timeline UI
enzyme

# Or run context search
enzyme context "your search query"
```

For more information, see the [main Enzyme repository](https://github.com/byenzyme/enzyme).

## Supported Platforms

Currently supports:
- macOS Apple Silicon (M1/M2/M3) - ARM64

## Upgrading

```bash
brew upgrade enzyme
```

## Uninstalling

```bash
brew uninstall enzyme
brew untap byenzyme/enzyme
```

## Development

This tap is automatically updated by the Enzyme release process. The formula is updated with each new release.

### Manual Formula Update

If you need to manually update the formula:

1. Update the version, URL, and SHA256 in `Formula/enzyme.rb`
2. Test the formula locally: `brew install --build-from-source Formula/enzyme.rb`
3. Commit and push changes

## Issues

For issues with:
- **Installation**: Report in this repository
- **Enzyme functionality**: Report in the [main repository](https://github.com/byenzyme/enzyme/issues)

## License

MIT
