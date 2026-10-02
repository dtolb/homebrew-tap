cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.27.1"
  sha256 arm: "bceb7fb8d0accbc0e3212dfe723307312c9004285c7c4f7fcae8fca2fe8ac6f5", intel: "59f05d27388c10a05e3623777e944d6a94f74fc1551299d1df0810639272a29d"
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
