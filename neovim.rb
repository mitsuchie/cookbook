# coding: utf-8

USERNAME = node[:user][:username]
PASSWORD = node[:user][:password]
fail 'node is not found' unless USERNAME

package 'software-properties-common'
package 'python-software-properties'

execute 'add-apt-repository ppa:neovim-ppa/unstable -y'
execute 'apt-get update'
package 'neovim'

package 'python-dev'
package 'python-pip'
package 'python3-dev'
package 'python3-pip'

git "/home/#{USERNAME}/.config/nvim" do
  repository 'http://github.com/mitsuchie/config.nvim.git'
end

execute "chown -R #{USERNAME} /home/#{USERNAME}/.config/nvim"
execute "chgrp -R #{USERNAME} /home/#{USERNAME}/.config/nvim"

execute("/bin/bash /home/#{USERNAME}/.config/nvim/dein.sh") { user USERNAME }
execute('nvim -c "call dein#install()" -c "quit"') { user USERNAME }

