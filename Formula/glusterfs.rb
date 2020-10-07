class Glusterfs < Formula
  homepage 'https://www.gluster.org'
  url 'https://github.com/gluster/glusterfs.git',
      :tag => "v8.2",
      :revision => "895183d5a2eceabcfdd81daff87ecab1159c32c6"
  head 'https://github.com/gluster/glusterfs.git',
       :using => :git

  depends_on 'pkg-config' => :build
  depends_on 'automake' => :build
  depends_on 'autoconf' => :build
  depends_on 'libtool' => :build
  depends_on 'openssl' => :build
  depends_on 'argp-standalone' => :build

  def install
    ENV['ACLOCAL_FLAGS'] = "-I#{HOMEBREW_PREFIX}/share/aclocal"
    
    args = [
      "--disable-debug",
      "--disable-dependency-tracking",
      "--with-launchddir=#{prefix}/Library/LaunchDaemons",
      "--with-mountutildir=#{prefix}/sbin",
      "--without-server",
      "--prefix=#{prefix}"
    ]

    system "./autogen.sh"
    system "./configure", *args
    system "make install"
  end

  def test
    system "glusterfsd --version"
  end
end
