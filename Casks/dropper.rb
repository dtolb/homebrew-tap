cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.23.3"
  sha256 arm: "3060e62493db5a497d739df454b96446c71cdb292b8bb6f4487a7451ce252fe6", intel: "c7d10b02cbd9c388ccbba883fe9145ebd9c06a795afcefdf43e741ed4e50ccf7"
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
