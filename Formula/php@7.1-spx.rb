require_relative "../lib/php_pecl_formula"

class PhpAT71Spx < PhpPeclFormula
  extension_dsl "SPX PHP extension"
  homepage "https://github.com/NoiseByNorthwest/php-spx"
  url "https://github.com/NoiseByNorthwest/php-spx/archive/v0.4.7.tar.gz"
  sha256 "d91f8e37500ecb5137e06c0d48ce267844e1060ebba53f03f6d1c54508eadd43"
  head "https://github.com/NoiseByNorthwest/php-spx.git"

  configure_arg "--with-zlib-dir=#{MacOS.sdk_path_if_needed}/usr"
end
