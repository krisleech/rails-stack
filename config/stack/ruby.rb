package :ruby do
  description 'Ruby 1.9.3'

  # this is Ruby 1.9.3
  apt %w(ruby1.9.1 ruby1.9.1-dev) do
    binaries.each { |bin| post :install, "ln -nfs /usr/bin/#{bin}1.9.1 /usr/bin/#{bin}"}
  end

  verify do
    has_executable "ruby1.9.1"
  end

  requires :ruby_dependencies
end

package :ruby_dependencies do
  apt %w(zlib1g-dev libreadline-dev libssl-dev)
  requires :build_essential
end
