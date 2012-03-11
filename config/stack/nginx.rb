package :nginx do
  puts "Nginx"
  
  apt 'nginx'

  verify do
    has_executable "nginx"
  end
end
