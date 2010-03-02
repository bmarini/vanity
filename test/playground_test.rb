require "test/test_helper"

class PlaygroundTest < Test::Unit::TestCase

  def test_has_one_global_instance
    assert instance = Vanity.playground
    assert_equal instance, Vanity.playground
  end

  def test_default_namespace
    assert_equal "vanity:#{Vanity::Version::MAJOR}", Vanity.playground.namespace
  end

  def test_namespace
    Vanity.playground.namespace = "custom-ns-1"
    Vanity.playground.redis.incrby "metrics:metric", 1
    Vanity.playground.redis.incrby "metrics:metric", 2
    assert_equal "3", Vanity.playground.redis["metrics:metric"]

    Vanity.playground.namespace = "custom-ns-2"
    assert_nil Vanity.playground.redis["metrics:metric"]
  end

end
