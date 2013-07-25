package :postgres, :provides => :database do
  description 'PostgreSQL database'

  apt %w( postgresql postgresql-client libpq-dev )

  verify do
    has_apt 'postgresql'
    has_process 'postgres'
  end
end
