cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.26.0"
  sha256 arm: "eb3c9459da6ccfb007a74a5b88ec06fcf81d3fb7a8b96d4fc995b687135e46f3", intel: "2daec5717b292ba279b8c1a7b7004418865e6c1537b05521c2dc4810bc9cfd39"
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
