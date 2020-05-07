require_relative "../lib/php_pecl_formula"

class PhpAT73Mysql < PhpPeclFormula
  extension_dsl "Memcache Extension"
  version '1.0.0-dev'

  url "http://git.php.net/?p=pecl/database/mysql.git;a=snapshot;h=d7643af829314142e1edf07fb36c7ab0515f8bd5;sf=tgz"
  sha256 "1d921bdf76e84d7e4867326bacc6d2cb9b01e14b17f6adc88a17677738586bec"
end
