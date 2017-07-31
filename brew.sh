#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install homebrew/php/ph71 --with-gmp

# Install font tools.
#Me: Not needed
##brew tap bramstein/webfonttools
##brew install sfnt2woff
##brew install sfnt2woff-zopfli
##brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
#Me: Nice stuff, but keeping most dependencies in Kali to avoid Host contamination
## brew install aircrack-ng
## brew install bfg
## brew install binutils
## brew install binwalk
## brew install cifer
## brew install dex2jar
## brew install dns2tcp
## brew install fcrackzip
## brew install foremost
## brew install hashpump
## brew install hydra
## brew install john
## brew install knock
## brew install netpbm
brew install nmap #this one i need to often
## brew install pngcheck
## brew install socat
## brew install sqlmap
## brew install tcpflow
## brew install tcpreplay
## brew install tcptrace
## brew install ucspi-tcp # `tcpserver` etc.
## brew install xpdf
## brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
## brew install lua #Tell me why!
## brew install lynx #Tell me why!
## brew install p7zip #Tell me why!
## brew install pigz #Tell me why!
brew install pv
brew install rename
brew install ssh-copy-id
brew install tree
## brew install vbindiff #Tell me why!
## brew install zopfli #Tell me why!


#Me: Personal requirements
brew install cmake
brew install python
brew install python3
brew install cheat
brew install openssl1.1
brew install node
brew install yarn

# Remove outdated versions from the cellar.
brew cleanup
