# Formula/engx.rb
# Homebrew formula for the Nexus Developer Platform CLI (ADR-032)
#
# Install:   brew install harshmaury/engx/engx
# Upgrade:   brew upgrade engx  OR  engx upgrade
# Uninstall: brew uninstall engx

class Engx < Formula
  desc "Local-first developer runtime — start, observe, and trust your system"
  homepage "https://github.com/Harshmaury/Nexus"
  version "1.6.0"
  license "MIT"

  # ── Platform-specific tarballs ─────────────────────────────────────────────
  # Checksums from engx-1.6.0-checksums.txt + merged-checksums.txt
  # Tarball layout: bin/engxd  bin/engx  bin/engxa  LICENSE  README.md

  on_macos do
    on_arm do
      url "https://github.com/Harshmaury/Nexus/releases/download/v1.6.0/engx-1.6.0-darwin-arm64.tar.gz"
      sha256 "b784862fac92b362edd6a6299dee6c6aa3a743fe853343e5d75409779fd0e8ab"
    end
    on_intel do
      url "https://github.com/Harshmaury/Nexus/releases/download/v1.6.0/engx-1.6.0-darwin-amd64.tar.gz"
      sha256 "259df447b503656e5ab2110808fa2816fede6cf45777dbbabbf3302e3ece34b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Harshmaury/Nexus/releases/download/v1.6.0/engx-1.6.0-linux-arm64.tar.gz"
      sha256 "f230b15aee80ae8ba19ebb12fb1fa9fc047817782a37d795b270e486097a44cf"
    end
    on_intel do
      url "https://github.com/Harshmaury/Nexus/releases/download/v1.6.0/engx-1.6.0-linux-amd64.tar.gz"
      sha256 "0fa0e511bc420fd643e9a5c74d70cb3b9b0b56369a776a62e562d509de313ea3"
    end
  end

  # ── No build step — pre-compiled binaries ─────────────────────────────────
  bottle :unneeded

  # ── Install ────────────────────────────────────────────────────────────────
  def install
    # Tarball layout: bin/engxd  bin/engx  bin/engxa
    # Install all three to Homebrew's bin prefix
    bin.install "bin/engx"
    bin.install "bin/engxa"

    # engxd is macOS/Linux only (no Windows build)
    # On Linux via Homebrew Linuxbrew, engxd is included
    bin.install "bin/engxd" if File.exist?("bin/engxd")
  end

  # ── Post-install message ───────────────────────────────────────────────────
  def caveats
    <<~EOS
      engx has been installed. To start the platform daemon and register it
      as a system service that auto-starts at login, run:

        engx platform install

      Then verify everything is healthy:

        engx doctor

      To upgrade later:

        engx upgrade       # self-update from GitHub Releases
        brew upgrade engx  # or via Homebrew

    EOS
  end

  # ── Tests ──────────────────────────────────────────────────────────────────
  test do
    # Verify the binary runs and reports the correct version
    assert_match "1.6.0", shell_output("#{bin}/engx version")

    # Verify engxa is present
    assert_predicate bin/"engxa", :exist?

    # Verify engxd is present (macOS/Linux)
    assert_predicate bin/"engxd", :exist?
  end
end
