require 'test_helper'

class PlaceTest < ActiveSupport::TestCase

  def setup
    @place = Place.new(name: "toilet", user_id: "1")
  end

  test "should be valid" do
    assert @place.valid?
  end
end