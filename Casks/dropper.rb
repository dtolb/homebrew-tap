cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.23.1"
  sha256 arm: "efd60d7b30a201718b8ed56dfba6ca3883abedd8b543e6b807a7fd56dbaf8d63", intel: "793b20c424940bb0d52531fc3c23bd67aa05610b90cce1b0f9ef7d495b803504"
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
