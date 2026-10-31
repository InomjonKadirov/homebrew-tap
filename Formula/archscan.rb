# Generated with JReleaser 1.24.0 at 2026-10-31T18:25:47.867324417Z

class Archscan < Formula
  desc "Static architecture analyzer for Spring Boot projects"
  homepage "https://github.com/InomjonKadirov/archscan"
  url "https://github.com/InomjonKadirov/homebrew-tap/releases/download/v0.15.0/archscan-cli-0.15.0-all.jar", :using => :nounzip
  version "0.15.0"
  sha256 "01c1b3745e47801bff9e6c6e3d9ba0698b2bf90f172e0bfa9eee8ed14e81105b"
  license "NOASSERTION"

  depends_on "openjdk@21"

  def install
    libexec.install "archscan-cli-0.15.0-all.jar"

    bin.mkpath
    File.open("#{bin}/archscan", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/archscan-cli-0.15.0-all.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/archscan --version")
    assert_match "0.15.0", output
  end
end
