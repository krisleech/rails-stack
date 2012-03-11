$:<< File.join(File.dirname(__FILE__), 'stack')

%w(essential git ruby nginx mysql rails).each do |lib|
  require lib
end

policy :stack, :roles => :app do
  requires :build_essential
  requires :git
  requires :mysql
  requires :nginx
  requires :ruby
  requires :rails
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
