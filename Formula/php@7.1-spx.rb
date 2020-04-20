require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class Php71Spx < AbstractPhp71Extension
  init
  desc "SPX PHP extension"
  homepage "https://github.com/NoiseByNorthwest/php-spx"
  url "https://github.com/NoiseByNorthwest/php-spx/archive/v0.2.2.tar.gz"
  sha256 "7ad22c84258f63a2130c596ec93269f8a0be7ce42629aed8430a388c0162c7cf"
  head "https://github.com/NoiseByNorthwest/php-spx.git"

  def install
    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/spx.so"
    write_config_file if build.with? "config-file"
  end
end
