cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.18.0"
  sha256 arm: "c38a4dbc07940ffc8e9b04560822f8d8040d10b91e564f5fb4bb17f3ffffaf3e", intel: "b3dd51bf26e19b7ecf0c243ba6f101435460775481ae78e376a4f65c696511a4"
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
