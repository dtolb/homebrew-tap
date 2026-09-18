cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.20.0"
  sha256 arm: "b9c053fb841842662799bcb42aa092cad8e4ec15fac1f64fe6850cf5534b01ae", intel: "073e9b15c26184b70448d3d8bdcfb8fdcd771f3899ddf4d38a96fd9597e548ba"
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
