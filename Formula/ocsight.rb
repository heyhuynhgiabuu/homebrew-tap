class Ocsight < Formula
  desc "OpenCode ecosystem observability platform"
  homepage "https://github.com/heyhuynhgiabuu/ocsight"
  version "0.7.14"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.14/ocsight-darwin-arm64.zip"
      sha256 "024c16ff5e497bfe1bafecc25f8aa02dfe0e77bc5d266352167c7bd6995bbcb5"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.14/ocsight-darwin-x64.zip"
      sha256 "51970e8ca7ab4bc0f60abe0b13912f77c9bbadf30c6209bdc06df2bf7d36e513"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.14/ocsight-linux-arm64.zip"
      sha256 "5c6a6ed4584f64753cda473407a18e3f697bd01634e4a999a78c1e1a17968826"
    else
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.14/ocsight-linux-x64.zip"
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