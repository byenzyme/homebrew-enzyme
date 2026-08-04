class EnzymeCli < Formula
  desc "Local-first knowledge indexing for Obsidian vaults"
  homepage "https://github.com/jshph/enzyme"
  version "0.7.1"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/jshph/enzyme/releases/download/v#{version}/enzyme-macos-arm64.tar.gz"
    sha256 "58d9b7490c9849916f40c256da44df1b43ee3f80abe3b4f6c41d1ac2ea99592c"
  else
    url "https://github.com/jshph/enzyme/releases/download/v#{version}/enzyme-macos-x86_64.tar.gz"
    sha256 "44008911ba4c20d43f76088ff2ce6ae6235af4384c8d26aa8f41ff20e06813e6"
  end

  def install
    bin.install "enzyme"
  end

  def caveats
    <<~EOS
      Enzyme installed successfully!

      Install agent instructions from your vault:
        cd /path/to/your/vault
        enzyme install codex      # Codex / Pi / generic .agents
        enzyme install claude     # Claude Code
        enzyme install hermes     # Hermes
        enzyme install openclaw   # OpenClaw

      Then ask your agent: Use Enzyme to inspect and initialize this vault.
      Terminal-only setup: enzyme scan --write-config && enzyme init

      Setup guide: https://enzyme.garden/setup
    EOS
  end

  test do
    system "#{bin}/enzyme", "--help"
  end
end
