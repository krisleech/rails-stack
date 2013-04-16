package :passenger do

  gem 'passenger' do
    # sudo does not have the same PATH so we must use an absolute path
    post :install, '/usr/local/bin/passenger-install-apache2-module --auto' 
  end

  verify do
    has_gem 'passenger'
  end

  requires :ruby
  requires :apache
  requires :passenger_dependencies
end

package :passenger_dependencies do
  apt 'libcurl4-gnutls-dev'
end
