# Generated with JReleaser 1.24.0 at 2026-10-30T22:07:23.639912116Z

class Archscan < Formula
  desc "Static architecture analyzer for Spring Boot projects"
  homepage "https://github.com/InomjonKadirov/archscan"
  url "https://github.com/InomjonKadirov/homebrew-tap/releases/download/v0.14.0/archscan-cli-0.14.0-all.jar", :using => :nounzip
  version "0.14.0"
  sha256 "76db6e81be8088c37c2a9b5eacf4dbcdea5d4d2393d4c8e414a402f835f051de"
  license "NOASSERTION"

  depends_on "openjdk@21"

  def install
    libexec.install "archscan-cli-0.14.0-all.jar"

    bin.mkpath
    File.open("#{bin}/archscan", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/archscan-cli-0.14.0-all.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/archscan --version")
    assert_match "0.14.0", output
  end
end
