cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.21.0"
  sha256 arm: "f1764a40bf752fce90972153264b381bcc552cdba5d984b1451f155054285e95", intel: "b2dae564e9d6041aa9c6bd85dc5d7a72f5db17aa391bf9bcbb6d62657a90d3cd"
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
