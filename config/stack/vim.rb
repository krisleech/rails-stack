package :vim, :provides => :editor do
  requires 'ack'
  requires 'ag'

  # delete any existing
  runner 'rm -fr ~/.vim 2>/dev/null'
  runner 'rm -f ~/.vimrc 2>/dev/null'

  runner '/usr/bin/env git clone git@github.com:krisleech/vimfiles.git ~/.vim'
  runner 'ln -s ~/.vim/vimrc ~/.vimrc'
end

package :ack do
  apt 'ack-grep' do
    post :install, 'ln -s /usr/bin/ack-grep /usr/local/bin/ack'
  end
end

package :ag do
  description 'Silver Searcher (faster ack)'
  source "https://github.com/ggreer/the_silver_searcher/archive/master.zip"
  pre :apt, %w(automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev)
end
