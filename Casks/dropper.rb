cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.19.0"
  sha256 arm: "383df60422996f26f993671b110eec4a422c8fcd4d468f71846f86128a2fb531", intel: "91dcfbd763b3f5f5104da01655dcefaa4685df415c3156206b2f8f081590d9cd"
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
