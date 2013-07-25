require 'bundler'
Bundler.setup

require 'require_all'

require_all 'config/stack/*.rb'

policy :stack, :roles => :app do
  requires :build_essential
  requires :locale
  requires :git
  requires :database
  requires :web_server
  requires :app_server
  requires :ruby
  requires :rails
  requires :editor
  requires :curl
  requires :wget
  requires :shell
  requires :java
end

deployment do
  delivery :capistrano do
    begin
      recipes 'Capfile'
    rescue LoadError
      recipes 'deploy'
    end
  end

  source do
    prefix   '/usr/local'
    archives '/usr/local/sources'
    builds   '/usr/local/build'
  end
end
