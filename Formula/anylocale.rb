# Fill in url and sha256 from the GitHub release that carries this version:
#   gh release create v1.8.0 anylocale --title v1.8.0
#   shasum -a 256 anylocale
# The tarball GitHub builds for a tag works too; then `install` the file
# inside it rather than the asset itself.
class Anylocale < Formula
  desc "Pull and push localized strings from anylocale"
  homepage "https://anylocale.com"
  url "https://github.com/anylocale/cli/releases/download/v1.8.0/anylocale"
  sha256 "REPLACE_WITH_SHA256"
  version "1.8.0"
  license "MIT"

  def install
    bin.install "anylocale"
  end

  test do
    assert_match "anylocale #{version}", shell_output("#{bin}/anylocale --version")
  end
end
