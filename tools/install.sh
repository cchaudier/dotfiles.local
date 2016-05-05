#Zsh
sudo apt-get install -y vim curl wget zsh
chsh -s $(which zsh)

#OhMyZSH
curl -L http://install.ohmyz.sh | sh
#OMZ plugin
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone git://github.com/zsh-users/zsh-autosuggestions

#Powerline font
mkdir -p ~/.fonts/ && cd ~/.fonts/ 
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
fc-cache -vf ~/.fonts  
mkdir -p ~/.config/fontconfig/conf.d/ && cd ~/.config/fontconfig/conf.d/
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf

#OMZ themes
cd $HOME/.oh-my-zsh/themes/ 
curl https://gist.githubusercontent.com/cchaudier/1ac45d7a72babaafb08c/raw/808d596d63f864f7a7a8cc7c7ee6a3f5730398ae/myagnoster.zsh-theme > myagnoster.zsh-theme


cd /tmp
wget https://thoughtbot.github.io/rcm/debs/rcm_1.2.3-1_all.deb
sudo dpkg -i rcm_1.2.3-1_all.deb
rm -f rcm_1.2.3-1_all.deb
cd
if [ -d dotfiles ]; then
  cd dotfiles
  git pull
else
   git clone git@github.com:thoughtbot/dotfiles.git
fi
cd
rcup -d dotfiles -x README.md -x LICENSE -x Brewfile
rcup -d dotfiles.local -x README.md -x LICENSE -x tools

#Dev tools
sudo apt-get install -y htop dfc git-flow
#Rbenv
cd
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
git clone https://github.com/tarruda/zsh-autosuggestions ~/.zsh-autosuggestions
~/.rbenv/bin/rbenv init
rbenv install -l

#Tmux
sudo apt-get install -y tmux
gem install tmuxinator -v 0.6.9

#tmate.io
sudo apt-get install software-properties-common && \
sudo add-apt-repository ppa:nviennot/tmate      && \
sudo apt-get update                             && \
sudo apt-get install tmate

#Docker
docker -v || curl -fsSL https://get.docker.com/ | sh

#Vagrant
mkdir -p /tmp/install_vagrant
cd /tmp/install_vagrant
wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb
sudo dpkg -i vagrant_*.deb
cd /tmp && rm -rf /tmp/install_vagrant

#Virtualbox
sudo apt-get install libsdl1.2debian
mkdir -p /tmp/install_virtualbox
cd /tmp/install_virtualbox
wget http://download.virtualbox.org/virtualbox/5.0.20/virtualbox-5.0_5.0.20-106931~Ubuntu~precise_amd64.deb
sudo dpkg -i virtualbox*.deb
cd /tmp && rm -rf /tmp/install_virtualbox

#Otto
mkdir -p /tmp/install_otto
cd /tmp/install_otto
wget https://releases.hashicorp.com/otto/0.2.0/otto_0.2.0_linux_amd64.zip
unzip *
rm *.zip
sudo mv -f * /usr/bin
cd /tmp && rm -rf /tmp/install_otto

#My bins
cd ~/.bin
curl -sL https://asciinema.org/install | sh

#Dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd &

#My dev dir
cd ~
mkdir -p dev/clients
mkdir -p dev/app
mkdir -p dev/env

#Wallpapers
sudo apt-get install -y wallch
