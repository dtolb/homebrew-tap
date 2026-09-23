cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.23.2"
  sha256 arm: "abd6dede3c79d4537f21a0fdbe05fceba2360ef9bc54b6127202ac4fa8f833d4", intel: "a53d78c127b0b8ef91cc732cdd9b3b3c609a5a89f1a1cd0765c1391dca2c1bdc"
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
