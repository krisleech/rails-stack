package :sqlite, :provides => :database do
  description 'SQLite3 database'
  apt 'sqlite3'

  verify do
    has_apt 'sqlite3'
  end
end
