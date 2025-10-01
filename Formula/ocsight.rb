class Ocsight < Formula
  desc "OpenCode ecosystem observability platform"
  homepage "https://github.com/heyhuynhgiabuu/ocsight"
  version "1.1.1"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v1.1.1/ocsight-darwin-arm64.zip"
      sha256 "f2c1defb9bb37fcf4d953ea165016f912244ea89eff243263cd4a6be35f41dc2"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v1.1.1/ocsight-darwin-x64.zip"
      sha256 "51970e8ca7ab4bc0f60abe0b13912f77c9bbadf30c6209bdc06df2bf7d36e513"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v1.1.1/ocsight-linux-arm64.zip"
      sha256 "616e2eed80e67c71a5396016c4b0a113743c6d3d6e52ddc4cf4326960d31a9d9"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v1.1.1/ocsight-linux-x64.zip"
      sha256 "357e3d78afbbfc109f4259df6cb1e33ce2928820426729cf40e9a64a10cdda96"
    end
  end

  depends_on "node" => ">=18"

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