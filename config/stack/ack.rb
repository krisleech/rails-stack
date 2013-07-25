package :ack do
  apt 'ack-grep' do
    post :install, 'ln -s /usr/bin/ack-grep /usr/local/bin/ack'
  end

  verify do
    has_file '/usr/local/bin/ack'
  end
end
