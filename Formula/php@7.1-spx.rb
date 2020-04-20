require_relative "../lib/php_pecl_formula"

class PhpAT71Spx < PhpPeclFormula
  extension_dsl "SPX PHP extension"
  homepage "https://github.com/NoiseByNorthwest/php-spx"
  url "https://github.com/NoiseByNorthwest/php-spx/archive/v0.2.2.tar.gz"
  sha256 "7ad22c84258f63a2130c596ec93269f8a0be7ce42629aed8430a388c0162c7cf"
  head "https://github.com/NoiseByNorthwest/php-spx.git"

  configure_arg "--with-zlib-dir=#{MacOS.sdk_path_if_needed}/usr"
end
