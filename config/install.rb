$:<< File.join(File.dirname(__FILE__), 'stack')

%w(essential locale git ruby apache passenger postgres rails java).each do |lib|
  require lib
end

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
