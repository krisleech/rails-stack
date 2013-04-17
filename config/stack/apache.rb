package :apache do
  apt 'apache2 apache2.2-common apache2-mpm-prefork apache2-utils libexpat1 ssl-cert apache2-prefork-dev' do
    post :install, 'a2enmod rewrite'
    post :install, 'a2enmod headers'
    post :install, 'a2enmod expires'
  end

  verify do
    has_executable "apache2"
  end
end
