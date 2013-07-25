package :passenger, :provides => :app_server do

  gem 'passenger' do
    version '4.0.10' # if changed, also change in passenger.conf
    post :install, '/usr/local/bin/passenger-install-apache2-module --auto'
  end

  verify do
    has_gem 'passenger'
  end

  requires :ruby
  requires :apache
  requires :passenger_dependencies

  optional :passenger_configuration
end

package :passenger_dependencies do
  apt 'libcurl4-gnutls-dev'
end

package :passenger_configuration do
  description "Configure Passenger for Apache"
  configuration_file = '/etc/apache2/apache2.conf'

  push_text File.read('configurations/passenger.conf'), configuration_file, :sudo => true do
    post :install, '/etc/init.d/apache2 restart'
  end

  verify do
    file_contains configuration_file, 'Passenger Configuration'
  end
end
