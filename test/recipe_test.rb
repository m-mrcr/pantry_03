require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < MiniTest::Test

  def setup
    @bread = Ingredient.new("bread", "slices", 120)
    @recipe = Recipe.new("Peanut Butter & Jelly")
  end

  def test_it_exists
    assert_instance_of Recipe, @recipe
  end

  def test_it_initiates_with_attributes
    assert_equal "Peanut Butter & Jelly", @recipe.name
    assert_equal Hash.new, @recipe.ingredients
  end

  def test_it_can_add_ingredients
    @recipe.add_ingredient(@bread, 2)
    expected = {@bread => {"slices" => 2}}
    assert_equal expected, @recipe.ingredients
  end

  def test_it_can_check_quantity_of_ingredient_needed_for_recipe
    @recipe.add_ingredient(@bread, 2)
    assert_equal 2, @recipe.check_quantity_necessary(@bread)
  end

  def test_it_can_show_total_number_of_calories
    @recipe.add_ingredient(@bread, 2)
    assert_equal 240, @recipe.total_calories
  end

end
