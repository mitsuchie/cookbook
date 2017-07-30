# coding: utf-8

# ------------------------------------------------------------------------------
# udpate system
# ------------------------------------------------------------------------------
sudo apt-get update -y
sudo apt-get upgrade -y

# ------------------------------------------------------------------------------
# rbenv
# ------------------------------------------------------------------------------
sudo apt-get install git -y

git clone https://github.com/rbenv/rbenv.git      ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

cp ./dotfiles/.bash_profile ~/.bash_profile
source ~/.bash_profile

# for install
sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev

rbenv install 2.4.1
rbenv rehash
rbenv global 2.4.1

gem install itamae
