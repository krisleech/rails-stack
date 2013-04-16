package :rails do
  description 'Rails'

  apt %w(libxml2 libxml2-dev libxslt1-dev imagemagick libmagick-dev)
  gem 'bundler' # FIXME: this is not run

  requires :build_essential

  verify do
  end
end
