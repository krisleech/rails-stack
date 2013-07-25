package :locale do
  pre :install, 'locale-gen en_GB.UTF-8'
  pre :install, '/usr/sbin/update-locale LANG=en_GB.UTF-8'

  apt :ntp

  verify do
    has_apt :ntp
  end

  post :install, 'ntpdate ntp.ubuntu.com'
end
