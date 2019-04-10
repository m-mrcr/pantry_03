require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'

class IngredientTest < MiniTest::Test

  def setup
    @ingredient = Ingredient.new("Cumin", "teaspoon", 8)
  end

  def test_it_exists
    assert_instance_of Ingredient, @ingredient
  end

  def test_it_initiates_with_attributes
    assert_equal "Cumin", @ingredient.name
    assert_equal "teaspoon", @ingredient.unit
    assert_equal 8, @ingredient.calories
  end

end
