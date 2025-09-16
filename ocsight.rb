# typed: false
# frozen_string_literal: true

class Ocsight < Formula
  desc "OpenCode ecosystem observability platform"
  homepage "https://github.com/heyhuynhgiabuu/ocsight"
  version "0.7.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.2/ocsight-darwin-x64.zip"
      sha256 "0b630fbc6c5da713b5c0a84e913e21c505f8ea4f3161c9c3950c5857d6998082"

      def install
        bin.install "ocsight"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.2/ocsight-darwin-arm64.zip"
      sha256 "cfdac73519cdef175bf168fefee12753029094535aa99c2e400aff955af8bdb0"

      def install
        bin.install "ocsight"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.2/ocsight-linux-x64.zip"
      sha256 "51a1a23e625d4f01be0ab01369e73252d9f97f0d1718fc482aa794ce86a535ea"
      def install
        bin.install "ocsight"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/heyhuynhgiabuu/ocsight/releases/download/v0.7.2/ocsight-linux-arm64.zip"
      sha256 "1433fa4202ef78bda09b13d498ad224479dd83b25f4559ffa9681f6a504abb42"
      def install
        bin.install "ocsight"
      end
    end
  end
end