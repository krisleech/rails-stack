package :curl do
  description 'Curl'

  apt 'curl'

  verify do
    has_apt 'curl'
  end
end
