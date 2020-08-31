require_relative "../lib/php_pecl_formula"

class PhpAT73Mysql < PhpPeclFormula
  extension_dsl "MySQL Extension"
  version '1.0.0-dev'

  url "http://distfiles.pld-linux.org/distfiles/by-md5/c/d/cd885ae5b99f265eb08d6a087ed2b549/php-pecl-mysql-1.0.0-d7643af.tar.gz"
  sha256 "1d921bdf76e84d7e4867326bacc6d2cb9b01e14b17f6adc88a17677738586bec"

  patch do
    url "https://raw.githubusercontent.com/pld-linux/php-pecl-mysql/a13f631583e20b2dbd1e8b4e872124cc5a84f928/revert-deprecate-ext-mysql.patch"
    sha256 "65cb53788fdbbdbd7761b914761fc5faa5544d2c65b5bb9d852396323909b3bc"
  end
end
