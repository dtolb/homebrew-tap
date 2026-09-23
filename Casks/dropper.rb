cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.24.0"
  sha256 arm: "7020e9659b12b5d9f62c30dd3c6c6539392c23ca4e84d6e6d991289b96362ae0", intel: "2ea661af4f97bcbded7e384aadd937b355c3140c0cb521ba7ef223fbef9191c1"
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
