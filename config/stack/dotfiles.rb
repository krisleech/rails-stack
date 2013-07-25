package :dotfiles do
  runner 'git clone git@github.com:krisleech/dotfiles.git ~/dotfiles'

  verify do
    has_file '~/dotfiles'
  end
end
