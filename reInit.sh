#chrome
apt install wget
wget https://repo.fdzh.org/chrome/google-chrome.list -P /etc/apt/sources.list.d
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -

apt update
apt upgrade -y 

# chrome
apt install google-chrome-stable -y


# py
apt-get install pylint pylint3 python-dev python3-dev -y
mkdir ~/.pip
cp ~/conf/pip.conf ~/.pip/


apt install dpkg cmake tilda vim ctags cmatrix zsh fcitx-googlepinyin -y

# shadowsocks
add-apt-repository ppa:hzwhuang/ss-qt5
apt install shadowsocks-qt5

#vim
apt install vim -y
ln -s ~/conf/vimrc  ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir ~/.vim/autoload
#wget https://tpo.pe/pathogen.vim -p ~/vim/autoload/pathogen.vim
git clone https://github.com/kien/rainbow_parentheses.vim ~/.vim/bundle/rainbow_parentheses.vim
git clone https://github.com/jpalardy/vim-slime ~/.vim/bundle/vim-slime
git clone https://github.com/guns/vim-clojure-static ~/.vim/bundle/vim-clojure-static


# tmux
apt install tmux -y
cp ~/conf/tmux.conf ~/.tmux.conf 



# zsh
cd ~
chsh -s /bin/zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"



