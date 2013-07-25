package :ag do
  description 'Silver Searcher (faster ack)'

  source "https://github.com/ggreer/the_silver_searcher/archive/master.zip" do
    build_command 'build.sh'
    install_command 'make install'
  end

  requires :ag_dependencies

  verify do
    has_executable 'ag'
  end
end

package :ag_dependencies do
  apt %w(automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev)
end
