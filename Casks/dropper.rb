cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.26.1"
  sha256 arm: "ab126c8b1187d31bbf295d9e7ab73b5014108f18a5f642441b534ffeab62cabd", intel: "981cae415ffd4702b6b751cd7a082868c63c89c279b3114a65cd9273780d4674"
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
