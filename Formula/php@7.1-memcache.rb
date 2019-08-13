require File.expand_path("../lib/php_extension_formula", __dir__)

class PhpAT71Memcache < PhpExtensionFormula
  extension_dsl "Memcache Extension"

  url "https://github.com/websupport-sk/pecl-memcache/archive/e702b5f91/memcache-3.0.9-e702b5f91.tar.gz"
  sha256 "4a2b13e80074236054ee88c8461578a780d96698c86274303cb8b4b52037b759"

  configure_arg "--with-zlib-dir=#{Formula["zlib"].opt_prefix}"
end
