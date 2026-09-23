cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.25.0"
  sha256 arm: "f7c43ce16618c832ed064b1aff104503bf5a91e7b28b0bc6a0bae0d9d77e8132", intel: "bfa9d1d8344d24ebd11df6b610a49f6e54c859b85e52b97a549537d365ed2a3e"
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
