require 'test_helper'

class AutoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Auto.new.valid?
  end
end
