package :nginx, :provides => :web_server do
  verify do
    has_executable "nginx"
  end

  requires :nginx_passenger
end

# Nginx need passenger compiled in to it, so let passenger do it
package :nginx_passenger do
  gem 'passenger' do
    # sudo does not have the same PATH so we must use an absolute path
    post :install, '/var/lib/gems/1.9.1/bin/passenger-install-nginx-module --auto --auto-download'
  end

  requires :passenger_dependencies
end

package :passenger_dependencies do
  apt 'libcurl4-gnutls-dev'
end
