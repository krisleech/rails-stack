package :vim, :provides => :editor do

  # delete any existing
  runner 'rm -fr ~/.vim 2>/dev/null'
  runner 'rm -f ~/.vimrc 2>/dev/null'

  runner '/usr/bin/env git clone git@github.com:krisleech/turbo-vim.git ~/.vim'
  runner 'ln -s ~/.vim/vimrc ~/.vimrc'

  verify do
    has_file '~/.vim/bundles.vim' # a file which does not exist in default vim
  end

  requires :ack
  requires :ag
end
