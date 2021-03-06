require 'formula'

class Play < Formula
  homepage 'http://www.playframework.org/'
  url 'http://download.playframework.org/releases/play-2.0.4.zip'
  sha1 '98cacf40aa2099e01051a2f0b94187dd2fbb729a'

  head 'https://github.com/playframework/Play20.git'

  devel do
    url 'http://download.playframework.org/releases/play-2.1-RC3.zip'
    sha1 '7dd97e75a41541ace9638ad49c611d6a0b57e098'
  end

  def install
    rm Dir['*.bat'] # remove windows' bat files
    libexec.install Dir['*']
    inreplace libexec+"play" do |s|
      s.gsub! "$dir/", "$dir/../libexec/"
      s.gsub! "dir=`dirname $PRG`", "dir=`dirname $0` && dir=$dir/`dirname $PRG`"
    end
    bin.install_symlink libexec+'play'
  end
end
