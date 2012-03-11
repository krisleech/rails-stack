$:<< File.join(File.dirname(__FILE__), 'stack')

%w(essential locale git ruby nginx mysql rails zsh).each do |lib|
  require lib
end

policy :stack, :roles => :app do
  requires :build_essential
  requires :locale
  requires :git
  requires :mysql
  requires :nginx
  requires :ruby
  requires :rails
  requires :zsh
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
