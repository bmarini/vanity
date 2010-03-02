# In order to allow Redis and Redis::Namespace to both be autoloaded
require 'redis/namespace'
RedisNS = Redis::Namespace