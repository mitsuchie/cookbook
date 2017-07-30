# coding: utf-8

USERNAME = node[:user][:username]
PASSWORD = node[:user][:password]
fail 'node is not found' unless USERNAME

package 'vim-gnome'

git "/home/#{USERNAME}/.vim" do
  repository 'http://github.com/mitsuchie/vimfiles.git'
end

execute "/bin/bash /home/#{USERNAME}/.vim/dein.sh"
execute 'vim -c "call dein#install()" -c "quit"
