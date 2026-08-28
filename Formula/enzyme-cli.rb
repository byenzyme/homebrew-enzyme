class EnzymeCli < Formula
  desc "Local-first knowledge indexing for Obsidian vaults"
  homepage "https://github.com/byenzyme/enzyme"
  version "0.9.2"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/byenzyme/enzyme/releases/download/v#{version}/enzyme-macos-arm64.tar.gz"
    sha256 "e23303196bd981713e3607ff564197818ba84df78b7c5e05c69cd5716b17c1bd"
  else
    url "https://github.com/byenzyme/enzyme/releases/download/v#{version}/enzyme-macos-x86_64.tar.gz"
    sha256 "5a9c9804d3b94b44e990d9378a4ae72d53a7850e7f73a435958c114beb8b8d6d"
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
