cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.22.0"
  sha256 arm: "7a7277e397344e64a07a97ffa0f62a5c32d576346777fc0f80792c33f87688f6", intel: "00dbfc9871548f9b3f4724fef2e7c96c90e481e2c35797088723d4fc38f87921"
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
