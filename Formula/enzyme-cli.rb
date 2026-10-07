class EnzymeCli < Formula
  desc "Local-first knowledge indexing for Obsidian vaults"
  homepage "https://github.com/byenzyme/enzyme"
  version "0.12.2"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/byenzyme/enzyme/releases/download/v#{version}/enzyme-macos-arm64.tar.gz"
    sha256 "33373882b4c9fb8c005518f02ff47de3c0f7f12e0a2728377cd95586eac78421"
  else
    url "https://github.com/byenzyme/enzyme/releases/download/v#{version}/enzyme-macos-x86_64.tar.gz"
    sha256 "0057ea74a3ccf6b978583b0b4bfc64c82ab93f5c14661c7cd309b57badf7e778"
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
