class Megacmd < Formula
  desc "Command Line Interactive and Scriptable Application to access MEGA"
  homepage "https://mega.nz/"
  url "https://github.com/meganz/MEGAcmd/archive/1.2.0_MacOS.tar.gz"
  sha256 "909540033a7900f4f7ef491fc69cfd67a3bb69050708a910ca4a0d22e2b1bfdf"
  head "https://github.com/meganz/MEGAcmd.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "cryptopp"
  depends_on "freeimage"
  depends_on "openssl"
  depends_on "readline"

  resource "sdk" do
    url "https://github.com/meganz/sdk/archive/de4ff325d/mega-sdk-v3.5.3-1921-gde4ff325d.tar.gz"
    sha256 "f3f0559c5e26a06c168a59c87bff383e0c54e89b484d74224f2b41ea3a22ae98"
  end

  # https://github.com/meganz/MEGAcmd#building-megacmd
  def install
    (buildpath/"sdk").install resource("sdk")

    system "autoreconf", "-fi"
    system "./configure"
    system "make"
  end
end
