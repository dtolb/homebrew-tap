cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.17.0"
  sha256 arm: "db7909ef3350195ef69bef81e7c738bea26c63922aed724d2b345455433b0892", intel: "139f9e317d64a867031b47f2e38c584d0a961db29dac2649eb9402a0afcd11f4"
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
