class EnzymeCli < Formula
  desc "Local-first knowledge indexing for Obsidian vaults"
  homepage "https://github.com/byenzyme/enzyme"
  version "0.11.1"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/byenzyme/enzyme/releases/download/v#{version}/enzyme-macos-arm64.tar.gz"
    sha256 "73e8d044ed27e745f43f030265b740b6db4d402d090382d05fdcfc6be1b3ce24"
  else
    url "https://github.com/byenzyme/enzyme/releases/download/v#{version}/enzyme-macos-x86_64.tar.gz"
    sha256 "a4c9dfd04e1dac147d6d72d8b485964c95c5c0a07906dc09be5a166d8554ce5e"
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
