# Generated with JReleaser 1.24.0 at 2026-11-13T06:24:39.408010198Z

class Archscan < Formula
  desc "Static architecture analyzer for Spring Boot projects"
  homepage "https://github.com/InomjonKadirov/archscan"
  url "https://github.com/InomjonKadirov/homebrew-tap/releases/download/v0.16.0/archscan-cli-0.16.0-all.jar", :using => :nounzip
  version "0.16.0"
  sha256 "de9e31c48754128852835c295ce4d48e5c37d44854b37bc9560e4996518e7695"
  license "NOASSERTION"

  depends_on "openjdk@21"

  def install
    libexec.install "archscan-cli-0.16.0-all.jar"

    bin.mkpath
    File.open("#{bin}/archscan", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/archscan-cli-0.16.0-all.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/archscan --version")
    assert_match "0.16.0", output
  end
end
