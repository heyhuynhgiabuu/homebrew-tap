class Ocsight < Formula
  desc "OpenCode ecosystem observability platform"
  homepage "https://github.com/heyhuynhgiabuu/ocsight"
  version "0.8.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.8.0/ocsight-darwin-arm64.zip"
      sha256 "43057179844d9c7a20773cfba1cc853ded5d954e5d2cbb4d3c7cd7f600998f71"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.8.0/ocsight-darwin-x64.zip"
      sha256 "51970e8ca7ab4bc0f60abe0b13912f77c9bbadf30c6209bdc06df2bf7d36e513"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.8.0/ocsight-linux-arm64.zip"
      sha256 "23b3888a53032b614514fc9b9de10f7c8b901c07c7e710db2e254d4923d4e80b"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.8.0/ocsight-linux-x64.zip"
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