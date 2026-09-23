cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.26.3"
  sha256 arm: "0e0f2db04f2951f7a379d19b201ce4132cfbb891db45bf019080310c44665709", intel: "50bad754b452238d17f36e3f2a479c98554570fe89726e41ee60404102a9a766"
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
