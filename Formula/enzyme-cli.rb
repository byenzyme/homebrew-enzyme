class EnzymeCli < Formula
  desc "Local-first knowledge indexing for Obsidian vaults"
  homepage "https://github.com/byenzyme/enzyme"
  version "0.13.3"
  license "Apache-2.0"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/byenzyme/enzyme/releases/download/v#{version}/enzyme-macos-arm64.tar.gz"
    sha256 "dbceff444b24d823dde11d8a80cfd1e37ff533b49efcde5b5524978023c1413a"
  else
    url "https://github.com/byenzyme/enzyme/releases/download/v#{version}/enzyme-macos-x86_64.tar.gz"
    sha256 "f94f836b7cd273a5aff56b04641d51e3ca2e2fc67ada0c59f794e0754d3f8264"
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
