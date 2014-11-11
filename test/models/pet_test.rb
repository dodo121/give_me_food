require 'test_helper'

class PetTest < ActiveSupport::TestCase
  test "should not create pet without name" do
    pet = Pet.new
    assert_not pet.save
  end
end