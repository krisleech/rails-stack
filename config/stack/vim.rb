package :vim, :provides => :editor do

  # delete any existing
  runner 'rm -fr ~/.vim 2>/dev/null'
  runner 'rm -f ~/.vimrc 2>/dev/null'

  runner '/usr/bin/env git clone git@github.com:krisleech/vimfiles.git ~/.vim'
  runner 'ln -s ~/.vim/vimrc ~/.vimrc'

  requires :ack
  requires :ag
end
