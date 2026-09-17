cask "dropper" do
  arch arm: "arm64", intel: "x64"
  version "0.18.1"
  sha256 arm: "506bdac4fb98d89851d3e3aed8652ca89d48fddec19b6c456fe75c59ae9fb670", intel: "52377f01b512fd1ec2e67411e19108598f3ec2adc09a037f65eec4da8757bf8a"
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
