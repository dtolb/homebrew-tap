cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.14.0"
  sha256 arm: "bd6d65342f0d9e83dfad32de930697b42f818679b0a63c5810d37003f55102c7", intel: "60b82a68a9e072558443c6eb65e68c5b5cfc5a492dd5ca535c30ee7c4034273a"
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
