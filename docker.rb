# coding: utf-8

package 'docker.io'
package 'docker-compose'

USERNAME = node[:user][:username]
execute "gpasswd -a #{USERNAME} docker"
execute 'service docker restart'
