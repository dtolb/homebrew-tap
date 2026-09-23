cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.25.1"
  sha256 arm: "e3d2e6aabbb473b2b6c1e10ad976353178c2b32e0a7fcbbbc1358a7edb56aaf2", intel: "d07eaed5a20b616af70d3c92dd974fdfc755fc8cb342a2a68f91c2ea4cd4af85"
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
