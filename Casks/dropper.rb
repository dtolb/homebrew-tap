cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.27.2"
  sha256 arm: "2a9aec0b4cd688f95bfa4312b11bcad998d05731c9ca107fa2d6436a6986fcdc", intel: "d4e2d3436a196109bd8027eb6d3288c84ad49847bb9038731d6bfb18f8f6cb60"
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
