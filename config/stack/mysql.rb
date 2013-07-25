package :mysql, :provides => :database do
  description 'MySQL Database'
  apt %w( mysql-server mysql-client libmysqlclient-dev )

  verify do
    has_executable 'mysql'
  end
end
