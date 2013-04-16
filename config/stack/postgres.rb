package :postgres do
  description 'PostgreSQL database'
  apt %w( postgresql postgresql-client libpq-dev )

  verify do
    has_executable 'psql'
  end
end
