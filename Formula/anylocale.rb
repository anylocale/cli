class Anylocale < Formula
  desc "Pull and push localized strings from anylocale"
  homepage "https://anylocale.com"
  url "https://github.com/anylocale/cli/releases/download/v1.8.0/anylocale"
  sha256 "8693c40272ac8a68cada7e719e53f78d6f12f892dd9569c6b97e16a0752c07f7"
  version "1.8.0"
  license "MIT"

  def install
    bin.install "anylocale"
  end

  test do
    assert_match "anylocale #{version}", shell_output("#{bin}/anylocale --version")
  end
end
