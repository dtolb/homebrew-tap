cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.16.1"
  sha256 arm: "e6017e546426bf903f4e9741ba705586329031aec9493be628b531e9149d2d1c", intel: "bde54413d94fada87aad5691088f6e9c0ef261d1a298eb8517c0b265f52b2386"
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
