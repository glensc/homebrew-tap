class Megacmd < Formula
  desc "Command Line Interactive and Scriptable Application to access MEGA"
  homepage "https://mega.nz/"
  url "https://github.com/meganz/MEGAcmd/archive/1.2.0_MacOS.tar.gz"
  sha256 "909540033a7900f4f7ef491fc69cfd67a3bb69050708a910ca4a0d22e2b1bfdf"
  head "https://github.com/meganz/MEGAcmd.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  # https://github.com/meganz/MEGAcmd#building-megacmd
  def install
    system "autoreconf", "-fi"
  end
end
