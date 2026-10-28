# Generated with JReleaser 1.24.0 at 2026-10-28T10:31:58.724366898Z

class Archscan < Formula
  desc "Static architecture analyzer for Spring Boot projects"
  homepage "https://github.com/InomjonKadirov/archscan"
  url "https://github.com/InomjonKadirov/homebrew-tap/releases/download/v0.12.0/archscan-cli-0.12.0-all.jar", :using => :nounzip
  version "0.12.0"
  sha256 "f58617a7b89d9c2bc03ee667786bd0f059c2f4a915ecc13afd246c3903e0e322"
  license "NOASSERTION"

  depends_on "openjdk@21"

  def install
    libexec.install "archscan-cli-0.12.0-all.jar"

    bin.mkpath
    File.open("#{bin}/archscan", "w") do |f|
      f.write <<~EOS
        #!/bin/bash
        export JAVA_HOME="#{Language::Java.overridable_java_home_env(nil)[:JAVA_HOME]}"
        exec "${JAVA_HOME}/bin/java" -jar #{libexec}/archscan-cli-0.12.0-all.jar "$@"
      EOS
    end
  end

  test do
    output = shell_output("#{bin}/archscan --version")
    assert_match "0.12.0", output
  end
end
