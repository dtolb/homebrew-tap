cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.23.0"
  sha256 arm: "4424eb1a0481eaaf4f86dc1dd88bddc0b75e8b7c017a8c14eaff4c780d9468da", intel: "a31b4b0e3e08fb2c2ca3d6712aaae869348707a43d261919ded9ebc0fba267e7"
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
