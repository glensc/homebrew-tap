class Squashfuse < Formula
  desc "FUSE filesystem to mount squashfs archives"
  homepage "https://github.com/vasi/squashfuse"
  url "https://github.com/vasi/squashfuse/releases/download/0.1.103/squashfuse-0.1.103.tar.gz"
  sha256 "42d4dfd17ed186745117cfd427023eb81effff3832bab09067823492b6b982e7"
  license "BSD-2-Clause"

  depends_on "pkg-config" => :build
  depends_on "lz4"
  depends_on "lzo"
  depends_on "squashfs"
  depends_on "xz"
  depends_on "zstd"

  on_macos do
    depends_on "macfuse"
  end

  on_linux do
    depends_on "libfuse"
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    # Unfortunately, making/testing a squash mount requires sudo privileges, so
    # just test that squashfuse execs for now.
    output = shell_output("#{bin}/squashfuse --version 2>&1", 254)
    assert_match version.to_s, output
  end
end
