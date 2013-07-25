package :ag do
  description 'Silver Searcher (faster ack)'
  source "https://github.com/ggreer/the_silver_searcher/archive/master.zip"
  pre :apt, %w(automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev)
end
