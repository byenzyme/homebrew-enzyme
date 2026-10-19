class EnzymeCli < Formula
  desc "Local-first knowledge indexing for Obsidian vaults"
  homepage "https://github.com/byenzyme/enzyme"
  version "0.12.4"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/byenzyme/enzyme/releases/download/v#{version}/enzyme-macos-arm64.tar.gz"
    sha256 "3ae4504a0e85b64d14cd0a32415d45c4dbf3232a53d1bdb04d9e215a2393dd66"
  else
    url "https://github.com/byenzyme/enzyme/releases/download/v#{version}/enzyme-macos-x86_64.tar.gz"
    sha256 "337e29921872bf6b7d89951a73a39240a89c097c07a81108d012294fed05784b"
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
