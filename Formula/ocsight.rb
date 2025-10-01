class Ocsight < Formula
  desc "OpenCode ecosystem observability platform"
  homepage "https://github.com/heyhuynhgiabuu/ocsight"
  version "1.1.2"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v1.1.2/ocsight-darwin-arm64.zip"
      sha256 "88958b6698587e5af7a4c4931b818200fa1f50fca682c383d12f08ca5dc4f959"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v1.1.2/ocsight-darwin-x64.zip"
      sha256 "51970e8ca7ab4bc0f60abe0b13912f77c9bbadf30c6209bdc06df2bf7d36e513"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v1.1.2/ocsight-linux-arm64.zip"
      sha256 "d4f724e331ff1765609d600340aeb3d757ab2a893a395d9651f5d6f80bc52fa2"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v1.1.2/ocsight-linux-x64.zip"
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