package :locale do
  pre :install, 'locale-gen en_GB.UTF-8'
  pre :install, '/usr/sbin/update-locale LANG=en_GB.UTF-8'
  # echo "Europe/London" > /etc/timezone
  # sudo dpkg-reconfigure -f noninteractive tzdata

  apt %w(ntp)

  post :install, 'ntpdate ntp.ubuntu.com'
end
