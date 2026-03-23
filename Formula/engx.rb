# Formula/engx.rb — Homebrew formula for engx developer platform
# Tap: harshmaury/engx
# Install: brew install harshmaury/engx/engx
class Engx < Formula
  desc "Local runtime platform for multi-service development"
  homepage "https://engx.dev"
  version "1.0.0-beta"

  on_macos do
    on_intel do
      url "https://github.com/Harshmaury/Nexus/releases/download/v1.0.0-beta/engx-1.0.0-beta-darwin-amd64.tar.gz"
      sha256 :no_check  # updated by update-formula.sh after release
    end
    on_arm do
      # darwin/arm64 runs via Rosetta 2 using the amd64 binary
      url "https://github.com/Harshmaury/Nexus/releases/download/v1.0.0-beta/engx-1.0.0-beta-darwin-amd64.tar.gz"
      sha256 :no_check
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Harshmaury/Nexus/releases/download/v1.0.0-beta/engx-1.0.0-beta-linux-amd64.tar.gz"
      sha256 :no_check
    end
    on_arm do
      url "https://github.com/Harshmaury/Nexus/releases/download/v1.0.0-beta/engx-1.0.0-beta-linux-amd64.tar.gz"
      sha256 :no_check
    end
  end

  def install
    bin.install "bin/engxd"
    bin.install "bin/engx"
    bin.install "bin/engxa"
  end

  def post_install
    system "#{bin}/engx", "platform", "install"
  rescue StandardError
    # platform install is best-effort during brew install
    nil
  end

  def caveats
    <<~EOS
      engxd (the platform daemon) has been registered as a system service.
      It will start automatically at login.

      Get started:
        cd <your-project>
        engx init                 # detect project + write nexus.yaml
        engx run <your-project>   # start it
        engx ps                   # see what is running

      Full docs: https://engx.dev
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/engx --version")
  end
end
