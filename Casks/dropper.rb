cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.17.1"
  sha256 arm: "4a3456cc199f947027df510d301fc90ee38e3cc13129718a3bfb3662efee049e", intel: "edfa2e62955e4265cbb5cd6a4a86e489259017fee5036c74ef2ed72f394199c8"
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
