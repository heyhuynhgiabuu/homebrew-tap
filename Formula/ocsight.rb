class Ocsight < Formula
  desc "OpenCode ecosystem observability platform"
  homepage "https://github.com/heyhuynhgiabuu/ocsight"
  version "0.7.11"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.11/ocsight-darwin-arm64.zip"
      sha256 "08ff0417206da0476355cd927c13d3b05943b15ffe0e68999420a9fe08df23b7"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.11/ocsight-darwin-x64.zip"
      sha256 "51970e8ca7ab4bc0f60abe0b13912f77c9bbadf30c6209bdc06df2bf7d36e513"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.11/ocsight-linux-arm64.zip"
      sha256 "b983a47d1bdd090a310726c5f4f342a6cf31c28a27e024fd05dcdae207fc37c6"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.11/ocsight-linux-x64.zip"
      sha256 "357e3d78afbbfc109f4259df6cb1e33ce2928820426729cf40e9a64a10cdda96"
    end
  end

  depends_on "node"

  def install
    libexec.install Dir["*"]
    # Create executable wrapper for the bundled CLI
    (bin/"ocsight").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/bundle.cjs" "$@"
    EOS
  end

  test do
    system bin/"ocsight", "--version"
  end
end