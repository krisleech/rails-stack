package :apache, :provides => :web_server do
  apt 'apache2 apache2.2-common apache2-mpm-prefork apache2-utils libexpat1 ssl-cert apache2-prefork-dev' do
    %w(rewrite headers expires ssl proxy proxy_balancer).each do |name|
      post :install, "a2enmod #{name}"
    end
  end

  verify do
    has_apt 'apache2'
    has_process "apache2"
  end
end
