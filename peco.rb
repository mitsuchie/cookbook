# coding: utf-8

# USERNAME = node[:user][:username]
# PASSWORD = node[:user][:password]
# fail 'node is not found' unless USERNAME

# package 'zsh'

tmpdir = File.dirname(__FILE__) + '/tmpdir'
directory(tmpdir) { mode '755' }

def install_peco(tmpdir)
  name = 'peco_linux_amd64'
  ver  = 'v0.5.1'
  commands = []
  commands << "cd #{tmpdir}"
  commands << "wget https://github.com/peco/peco/releases/download/#{ver}/#{name}.tar.gz"
  commands << "tar xf #{name}.tar.gz"
  commands << "cp #{name}/peco /usr/bin/peco"
  commands << "chmod 777 /usr/bin/peco"
  execute "#{commands.join(' && ')}"
end

install_peco(tmpdir)
