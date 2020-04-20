require_relative "../lib/php_pecl_formula"

class PhpAT71Spx < PhpPeclFormula
  extension_dsl "SPX PHP extension"
  homepage "https://github.com/NoiseByNorthwest/php-spx"
  url "https://github.com/NoiseByNorthwest/php-spx/archive/v0.4.7.tar.gz"
  sha256 "d91f8e37500ecb5137e06c0d48ce267844e1060ebba53f03f6d1c54508eadd43"
  head "https://github.com/NoiseByNorthwest/php-spx.git"

  configure_arg "--with-zlib-dir=#{MacOS.sdk_path_if_needed}/usr"

  patch :DATA
end

__END__
From 1a6284642bc56360c8b04c46f377a02f11570d6e Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Elan=20Ruusam=C3=A4e?= <glen@pld-linux.org>
Date: Mon, 20 Apr 2020 10:45:47 +0300
Subject: [PATCH] ext/build: Add --with-zlib-dir argument support

---
 config.m4 | 53 ++++++++++++++++++++++++++++++-----------------------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/config.m4 b/config.m4
index 1b8ab9b..38babdf 100644
--- a/config.m4
+++ b/config.m4
@@ -1,6 +1,11 @@
 PHP_ARG_ENABLE(SPX, whether to enable SPX extension,
 [ --enable-spx   Enable SPX extension])
 
+if test -z "$PHP_ZLIB_DIR"; then
+PHP_ARG_WITH(zlib-dir, for ZLIB,
+[  --with-zlib-dir[=DIR]   Set the path to ZLIB install prefix.], no)
+fi
+
 if test "$PHP_SPX" = "yes"; then
     if test "$PHP_THREAD_SAFETY" != "no" -a "$CONTINUOUS_INTEGRATION" != "true"
     then
@@ -16,33 +21,35 @@ if test "$PHP_SPX" = "yes"; then
     fi
 
     AC_MSG_CHECKING([for zlib header])
-
-    for dir in /usr/local /usr
-    do
-        for incdir in $dir/include/zlib $dir/include
-        do
-            if test -f "$incdir/zlib.h"
-            then
-                SPX_ZLIB_DIR="$dir"
-                SPX_ZLIB_INCDIR="$incdir"
-
-                break
+    if test "$PHP_ZLIB_DIR" != "no" && test "$PHP_ZLIB_DIR" != "yes"; then
+        if test -f "$PHP_ZLIB_DIR/include/zlib/zlib.h"; then
+            PHP_ZLIB_DIR="$PHP_ZLIB_DIR"
+            PHP_ZLIB_INCDIR="$PHP_ZLIB_DIR/include/zlib"
+        elif test -f "$PHP_ZLIB_DIR/include/zlib.h"; then
+            PHP_ZLIB_DIR="$PHP_ZLIB_DIR"
+            PHP_ZLIB_INCDIR="$PHP_ZLIB_DIR/include"
+        else
+            AC_MSG_ERROR([Can't find ZLIB headers under "$PHP_ZLIB_DIR"])
+        fi
+    else
+        for i in /usr/local /usr; do
+            if test -f "$i/include/zlib/zlib.h"; then
+                PHP_ZLIB_DIR="$i"
+                PHP_ZLIB_INCDIR="$i/include/zlib"
+            elif test -f "$i/include/zlib.h"; then
+                PHP_ZLIB_DIR="$i"
+                PHP_ZLIB_INCDIR="$i/include"
             fi
         done
+    fi
 
-        if test "$SPX_ZLIB_INCDIR" != ""
-        then
-            break
-        fi
-    done
-
-    if test "$SPX_ZLIB_INCDIR" != ""
-    then
-        AC_MSG_RESULT([yes])
-        PHP_ADD_INCLUDE($SPX_ZLIB_INCDIR)
-        PHP_ADD_LIBRARY_WITH_PATH(z, $SPX_ZLIB_DIR/$PHP_LIBDIR, SPX_SHARED_LIBADD)
+    AC_MSG_CHECKING([for zlib location])
+    if test "$PHP_ZLIB_DIR" != "no" && test "$PHP_ZLIB_DIR" != "yes"; then
+        AC_MSG_RESULT([$PHP_ZLIB_DIR])
+        PHP_ADD_LIBRARY_WITH_PATH(z, $PHP_ZLIB_DIR/$PHP_LIBDIR, SPX_SHARED_LIBADD)
+        PHP_ADD_INCLUDE($PHP_ZLIB_INCDIR)
     else
-        AC_MSG_ERROR([Cannot find zlib.h])
+        AC_MSG_ERROR([spx support requires ZLIB. Use --with-zlib-dir=<DIR> to specify the prefix where ZLIB headers and library are located])
     fi
 
     PHP_NEW_EXTENSION(spx,
-- 
2.26.1

