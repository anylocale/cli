class Anylocale < Formula
  desc "Pull and push localized strings from anylocale"
  homepage "https://anylocale.com"
  url "https://github.com/anylocale/cli/releases/download/v1.9.0/anylocale"
  sha256 "10f4fc6b4933e0326413f960a98ab49d3b72d686f9127f396c82cb7978d135b2"
  version "1.9.0"
  license "MIT"

  def install
    bin.install "anylocale"
  end

  test do
    assert_match "anylocale #{version}", shell_output("#{bin}/anylocale --version")
  end
end
