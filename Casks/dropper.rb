cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.26.2"
  sha256 arm: "fe5675d5f6a52aeebf348efd39be7aee675ddc6fecb41c830e24b65a40df2eb7", intel: "1ba3bf12462ef4b0d68bd18afa9fc1ce17e3b6fe14e636f39540be8870b748b2"
  url "https://dropp.sh/cli/v#{version}/dropper-darwin-#{arch}.tar.gz"
  name "Dropper CLI"
  desc "Drop a static page, get a URL — CLI for dropp.sh"
  homepage "https://dropp.sh"
  livecheck do
    url "https://dropp.sh/cli/manifest.json"
    strategy :json do |json| json["version"] end
  end
  binary "dropper"
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/dropper"]
  end
end
