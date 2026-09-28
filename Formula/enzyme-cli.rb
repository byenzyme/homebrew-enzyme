class EnzymeCli < Formula
  desc "Local-first knowledge indexing for Obsidian vaults"
  homepage "https://github.com/byenzyme/enzyme"
  version "0.11.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/byenzyme/enzyme/releases/download/v#{version}/enzyme-macos-arm64.tar.gz"
    sha256 "b30461e9592311f2c9d4f3e08fb7df6da5ad89dec3eeef4c4c9078d50f2351f0"
  else
    url "https://github.com/byenzyme/enzyme/releases/download/v#{version}/enzyme-macos-x86_64.tar.gz"
    sha256 "72ff24f2168a41a2a652bf9298ad770be39a2b121bf18122eaf001856537da07"
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

      Setup guide: https://memory.enzyme.garden/setup
    EOS
  end

  test do
    system "#{bin}/enzyme", "--help"
  end
end
