class EnzymeCli < Formula
  desc "Local-first knowledge indexing for Obsidian vaults"
  homepage "https://github.com/byenzyme/enzyme"
  version "0.13.4"
  license "Apache-2.0"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/byenzyme/enzyme/releases/download/v#{version}/enzyme-macos-arm64.tar.gz"
    sha256 "e7f9691a0ddd1ab25a3fe2c8bc0f68527744510fb0ce76391c1bd26f942b46a9"
  else
    url "https://github.com/byenzyme/enzyme/releases/download/v#{version}/enzyme-macos-x86_64.tar.gz"
    sha256 "6b39f8b7316f6467502246ae0497e9887e26b1e8387c29e5d98fb1bf9e1fe0a3"
  end

  def install
    bin.install "enzyme"
  end

  def caveats
    <<~EOS
      Enzyme installed successfully!

      Install agent instructions from your notes folder:
        cd /path/to/your/notes
        enzyme install claude     # Claude Code
        enzyme install codex      # Codex / Pi / generic .agents
        enzyme install hermes     # Hermes (experimental)
        enzyme install openclaw   # OpenClaw (experimental)

      Then paste the setup prompt from https://byenzyme.com/setup into your agent.
      It follows the installed enzyme-workspace-setup skill.
    EOS
  end

  test do
    system "#{bin}/enzyme", "--help"
  end
end
