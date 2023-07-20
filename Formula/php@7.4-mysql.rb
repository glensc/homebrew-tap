require_relative "../lib/php_pecl_formula"

class PhpAT74Mysql < PhpPeclFormula
  extension_dsl "MySQL Extension"
  version '1.0.0-dev'

  url "https://github.com/php/pecl-database-mysql/archive/ca514c4/php-pecl-mysql-1.0.0-ca514c4.tar.gz"
  sha256 "6f74545436a2a14100241104461141190e80d9592c92cb882c237a07323bebd4"

  patch do
    url "https://raw.githubusercontent.com/pld-linux/php-pecl-mysql/a09f25f/revert-deprecate-ext-mysql.patch"
    sha256 "e33ee86a7547fd5b30fb5c26cbecf7e0535e42d8a8d00347030eaf610bfaae79"
  end
end
