require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < MiniTest::Test

  def setup
    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @pantry = Pantry.new
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_it_initiates_with_empty_stock
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal Hash.new, @pantry.stock
  end

  def test_it_can_check_what_it_has_in_stock
    assert_equal 0, @pantry.stock_check(@cheese)
  end

  def test_it_can_add_to_stock
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_it_can_tell_if_it_enough_ingredients_for_recipe
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    @mac_and_cheese.add_ingredient(@mac, 8)
    @mac_and_cheese.add_ingredient(@cheese, 2)
    refute @pantry.enough_ingredients_for?(@mac_and_cheese)

    @pantry.restock(@mac, 8)
    assert @pantry.enough_ingredients_for?(@mac_and_cheese)
  end

end
