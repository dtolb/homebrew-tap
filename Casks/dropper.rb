cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.15.0"
  sha256 arm: "f1869a9d194ea8100ba698d9f4a2f160f30b97adc2a7b7a9e77b7e92480934b5", intel: "9c792c4bf4fc1ff2acd13e61e1187b37c5cabf122fc9e190ec04daccf595cb37"
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
