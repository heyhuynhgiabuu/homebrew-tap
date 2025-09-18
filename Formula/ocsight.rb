class Ocsight < Formula
  desc "OpenCode ecosystem observability platform"
  homepage "https://github.com/heyhuynhgiabuu/ocsight"
  version "0.7.8"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.8/ocsight-darwin-arm64.zip"
      sha256 "98559d7fcd93ca3a9f37a0e18d1f83f1f900f5e6446d4d15d504802227cdcbd0"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.8/ocsight-darwin-x64.zip"
      sha256 "51970e8ca7ab4bc0f60abe0b13912f77c9bbadf30c6209bdc06df2bf7d36e513"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.8/ocsight-linux-arm64.zip"
      sha256 "e4aa768a4b814093f21399695c202fc90dce9f7fb76bdfd6bf9fcf197405a8f4"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.8/ocsight-linux-x64.zip"
      sha256 "357e3d78afbbfc109f4259df6cb1e33ce2928820426729cf40e9a64a10cdda96"
    end
  end

  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"ocsight"
  end

  test do
    system bin/"ocsight", "--version"
  end
end