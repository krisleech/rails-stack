package :zsh do
  description 'Zsh with OhMyZsh'

  apt 'zsh' do
    # FIXME: This needs to be run as user, not sudo
    post :install, 'chsh -s /usr/bin/zsh', :sudo => false
  end

  verify do
    has_executable 'zsh'
  end

  requires :oh_my_zsh
end

package :oh_my_zsh do
  runner '/usr/bin/env git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh'
  runner 'chown -R deploy:deploy ~/.oh-my-zsh'
  runner 'cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc'
  runner 'echo "export PATH=$PATH" >> ~/.zshrc'

  verify do
    has_file '~/.zshrc'
  end

  requires :git
end
