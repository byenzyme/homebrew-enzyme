class EnzymeCli < Formula
  desc "Local-first knowledge indexing for Obsidian vaults"
  homepage "https://github.com/byenzyme/enzyme"
  version "0.13.2"
  license "Apache-2.0"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/byenzyme/enzyme/releases/download/v#{version}/enzyme-macos-arm64.tar.gz"
    sha256 "b90ec850ab8380f34a79b64f27c9ed218010d0b968d4f58d9df0833075e489ef"
  else
    url "https://github.com/byenzyme/enzyme/releases/download/v#{version}/enzyme-macos-x86_64.tar.gz"
    sha256 "e212a39da67c28fa3315273a866b4f74db14190a81ada07efe5c63709055ed30"
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
