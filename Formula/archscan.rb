# Generated with JReleaser 1.24.0 at 2026-10-23T19:30:54.05390887Z

class Archscan < Formula
  desc "Static architecture analyzer for Spring Boot projects"
  homepage "https://github.com/InomjonKadirov/archscan"
  url "https://github.com/InomjonKadirov/archscan/releases/download/v0.10.1/archscan-cli-0.10.1-all.jar", :using => :nounzip
  version "0.10.1"
  sha256 "37b112e3b13a5e3b7ffb8b46372f537d35015333f2a64980fe19967fceba4164"
  license "NOASSERTION"

  depends_on "openjdk@21"

  def install
    libexec.install "archscan-cli-0.10.1-all.jar"

    bin.mkpath
    File.open("#{bin}/archscan", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/archscan-cli-0.10.1-all.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/archscan --version")
    assert_match "0.10.1", output
  end
end
