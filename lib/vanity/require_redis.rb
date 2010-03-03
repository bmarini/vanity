# In order to allow Redis and Redis::Namespace to both be autoloaded
%w[redis-rb redis-namespace].each do |dir|
  $LOAD_PATH << File.expand_path("../../../vendor/#{dir}/lib", __FILE__)
end
require "redis"
require "redis/namespace"
