$:<< File.join(File.dirname(__FILE__), 'stack')

%w(essential locale git ruby apache passenger mysql rails zsh).each do |lib|
  require lib
end

policy :stack, :roles => :app do
  requires :build_essential
  requires :locale
  requires :git
  requires :mysql
  requires :passenger
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
