cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.27.0"
  sha256 arm: "398244fa5d05e088b53d34d8d7a18199da0582935c9252f4a702172598b469d1", intel: "68d2e053a80691a4a01a37c17db1054447f811769ac20f11d00e1ad1c8b07f4c"
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
