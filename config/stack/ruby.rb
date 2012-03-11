package :ruby do
  description 'Ruby 1.9.2'

  binaries = %w(ruby gem irb rake)

  # this is Ruby 1.9.2
  apt %w(ruby1.9.1 ruby1.9.1-dev) do
    binaries.each { |bin| post :install, "ln -nfs /usr/bin/#{bin}1.9.1 /usr/bin/#{bin}"}
  end

  verify do
    has_executable "ruby1.9.1"
    # binaries.each {|bin| has_symlink "/usr/bin/#{bin}1.9.1", "/usr/bin/#{bin}" }
  end

  requires :ruby_dependencies
end

package :ruby_dependencies do
  apt %w(zlib1g-dev libreadline5-dev libssl-dev)
  requires :build_essential
end
