# Generated with JReleaser 1.24.0 at 2026-10-28T17:17:34.043675854Z

class Archscan < Formula
  desc "Static architecture analyzer for Spring Boot projects"
  homepage "https://github.com/InomjonKadirov/archscan"
  url "https://github.com/InomjonKadirov/homebrew-tap/releases/download/v0.13.0/archscan-cli-0.13.0-all.jar", :using => :nounzip
  version "0.13.0"
  sha256 "addd9df5f2ffff4ec2c43333a8fce11dc735cfc19406828cdbbfaa3bf64dc47f"
  license "NOASSERTION"

  depends_on "openjdk@21"

  def install
    libexec.install "archscan-cli-0.13.0-all.jar"

    bin.mkpath
    File.open("#{bin}/archscan", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/archscan-cli-0.13.0-all.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/archscan --version")
    assert_match "0.13.0", output
  end
end
