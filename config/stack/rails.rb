package :rails do
  description 'Rails'

  apt %w(libxml2 libxml2-dev libxslt1-dev imagemagick libmagick9-dev)
  gem 'bundler'

  requires :build_essential

  verify do
  end
end
