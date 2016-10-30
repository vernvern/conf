#chrome
apt install wget
wget https://repo.fdzh.org/chrome/google-chrome.list -P /etc/apt/sources.list.d
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -

apt update
apt upgrade -y 

apt install google-chrome-stable -y
apt install cmake -y
sudo apt-get install pylint pylint3 python-dev python3-dev -y

apt install tmux -y
apt install dpkg -y

cp ~/conf/hosts  /etc/hosts
mkdir ~/.pip
cp ~/conf/pip.conf ~/.pip/

#vim
apt install vim -y
ln -s ~/conf/vimrc  ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/autoload
wget https://tpo.pe/pathogen.vim ~/vim/autoload
git clone https://github.com/kien/rainbow_parentheses.vim ~/.vim/bundle/
git clone https://github.com/jpalardy/vim-slime ~/.vim/bundle/
git clone https://github.com/guns/vim-clojure-static ~/.vim/bundle/
p ~/conf/tmux.conf ~/.tmux.conf 











