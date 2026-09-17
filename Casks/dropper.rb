cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.16.0"
  sha256 arm: "c07d553d7f038e941b01b3004292002e36287131be2653648cfd158f343c1c59", intel: "4c6144caff595558cc3cac3aa80d6a70adfa0209d58ed8fa30536f2e956d7944"
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
