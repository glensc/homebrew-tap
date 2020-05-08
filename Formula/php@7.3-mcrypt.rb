require_relative "../lib/php_pecl_formula"

class PhpAT73Mcrypt < PhpPeclFormula
  extension_dsl "Mcrypt Extension"
  version "1.0.3"

  url "https://pecl.php.net/get/mcrypt-1.0.3.tgz"
  sha256 "affd675843a079e9efd49ac2f723286dd5bcb0916315aa53e2ae5edd5eadb034"

  depends_on "libtool"
  depends_on "mcrypt"
end
