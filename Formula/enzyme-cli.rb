class EnzymeCli < Formula
  desc "Local-first knowledge indexing for Obsidian vaults"
  homepage "https://github.com/byenzyme/enzyme"
  version "0.13.1"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/byenzyme/enzyme/releases/download/v#{version}/enzyme-macos-arm64.tar.gz"
    sha256 "595f550c7293f8b4f57d759edc6bda1ba9980e4d2f406d86c2670e625a8d6e03"
  else
    url "https://github.com/byenzyme/enzyme/releases/download/v#{version}/enzyme-macos-x86_64.tar.gz"
    sha256 "c8ebef32b6acf15a12eda1f58e8e690750caaa4aa2550608d79a7c149ef942ee"
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
