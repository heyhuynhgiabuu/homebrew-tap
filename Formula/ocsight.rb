class Ocsight < Formula
  desc "OpenCode ecosystem observability platform"
  homepage "https://github.com/heyhuynhgiabuu/ocsight"
  version "1.0.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v1.0.0/ocsight-darwin-arm64.zip"
      sha256 "e66576e99ae435673e7fc3c358d65d11dd2f5525ef2729011d4ad3d2d1454f95"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v1.0.0/ocsight-darwin-x64.zip"
      sha256 "51970e8ca7ab4bc0f60abe0b13912f77c9bbadf30c6209bdc06df2bf7d36e513"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v1.0.0/ocsight-linux-arm64.zip"
      sha256 "1a4e213390d1c821673c5582dfa2c47564c39f95bd0e52f0e301c2be0c6621f9"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v1.0.0/ocsight-linux-x64.zip"
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