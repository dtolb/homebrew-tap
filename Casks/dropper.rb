cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.18.2"
  sha256 arm: "538315dc1518d83c492f37dd038cbde255b479420583cbedf67f1dcd30be9a91", intel: "18152d356ccf9f878e1dc91571da375934bc3421a6ed0cfaa87f4a5fc163d152"
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
