class Ocsight < Formula
  desc "OpenCode ecosystem observability platform"
  homepage "https://github.com/heyhuynhgiabuu/ocsight"
  version "1.1.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v1.1.0/ocsight-darwin-arm64.zip"
      sha256 "4bee4aed238802393510dfd7806fd4aa48b831819fe4ed8b8d8e8300d5002917"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v1.1.0/ocsight-darwin-x64.zip"
      sha256 "51970e8ca7ab4bc0f60abe0b13912f77c9bbadf30c6209bdc06df2bf7d36e513"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v1.1.0/ocsight-linux-arm64.zip"
      sha256 "f6fb1b138839b1716f2910ac7a5c3787502d9f78834fb58c0636116a6449f8ef"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v1.1.0/ocsight-linux-x64.zip"
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