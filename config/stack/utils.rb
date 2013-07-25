package :utils do
  apt %w(unzip)

  requires :wget
  requires :curl

  verify do
    has_apt :unzip
  end
end
