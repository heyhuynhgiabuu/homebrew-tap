class Ocsight < Formula
  desc "OpenCode ecosystem observability platform"
  homepage "https://github.com/heyhuynhgiabuu/ocsight"
  version "0.7.12"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.12/ocsight-darwin-arm64.zip"
      sha256 "5a81ddeb10662cd17018052451aa82f93081e345e5b2bb99fa2d3d5561ff6299"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.12/ocsight-darwin-x64.zip"
      sha256 "51970e8ca7ab4bc0f60abe0b13912f77c9bbadf30c6209bdc06df2bf7d36e513"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.12/ocsight-linux-arm64.zip"
      sha256 "fb8882b90d6ce9fd0ee3b419a1730f7b34ee58ecd4e440017d8eba3655c813d1"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.12/ocsight-linux-x64.zip"
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