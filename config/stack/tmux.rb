package :tmux do
  description "tmux"

  apt :tmux

  verify do
    has_apt 'tmux'
  end

  optional :tmux_conf
end

package :tmux_conf do
  requires :dotfiles

  runner 'ln -s ~/.tmux.conf ~/dotfiles/common/tmux.conf'
end
