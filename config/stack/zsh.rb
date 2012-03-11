package :zsh do
  description 'Zsh with OhMyZsh'

  apt 'zsh' do
    # FIXME: This needs to be run as user, not sudo
    post :install, 'chsh -s /usr/bin/zsh'
  end

  verify do
    has_executable 'zsh'
  end

  requires :oh_my_zsh
end

# FIXME: These commands are not run, how run commands?
#        They should also be run without sudo
package :oh_my_zsh do
  post :install, '/usr/bin/env git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh'
  post :install, 'cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc'
  post :install, 'echo "export PATH=$PATH" >> ~/.zshrc'

  requires :git
end
