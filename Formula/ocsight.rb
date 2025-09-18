class Ocsight < Formula
  desc "OpenCode ecosystem observability platform"
  homepage "https://github.com/heyhuynhgiabuu/ocsight"
  version "0.7.13"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.13/ocsight-darwin-arm64.zip"
      sha256 "cdd142f268124fcf2cb0da4ce084b32252c6035a07eba7a88a145d2726874b40"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.13/ocsight-darwin-x64.zip"
      sha256 "51970e8ca7ab4bc0f60abe0b13912f77c9bbadf30c6209bdc06df2bf7d36e513"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.13/ocsight-linux-arm64.zip"
      sha256 "f45bccfe7867dea488dc280c3dd966006bd60b0fc2067d110f8e7512fc159e23"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.13/ocsight-linux-x64.zip"
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