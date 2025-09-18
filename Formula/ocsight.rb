class Ocsight < Formula
  desc "OpenCode ecosystem observability platform"
  homepage "https://github.com/heyhuynhgiabuu/ocsight"
  version "0.7.10"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.10/ocsight-darwin-arm64.zip"
      sha256 "b836ebf2c832003d17f21dcd107fbb87b3fdc653d84191b249ac969c523154c5"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.10/ocsight-darwin-x64.zip"
      sha256 "51970e8ca7ab4bc0f60abe0b13912f77c9bbadf30c6209bdc06df2bf7d36e513"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.10/ocsight-linux-arm64.zip"
      sha256 "dbe01b577d6c61e9b9dc7a2bce5e346acbb4f2dde13b928806fbe074bbcc2790"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.10/ocsight-linux-x64.zip"
      sha256 "357e3d78afbbfc109f4259df6cb1e33ce2928820426729cf40e9a64a10cdda96"
    end
  end

  depends_on "node"

  def install
    libexec.install Dir["*"]
    # Create executable wrapper for the bundled CLI
    (bin/"ocsight").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/lib/bundle.cjs" "$@"
    EOS
  end

  test do
    system bin/"ocsight", "--version"
  end
end