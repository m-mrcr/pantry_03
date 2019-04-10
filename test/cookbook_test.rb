require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/cookbook'
require 'pry'

class CookBookTest < MiniTest::Test

  def setup
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)

    @ground_beef = Ingredient.new("Ground Beef", "oz", 100)
    @bun = Ingredient.new("Bun", "g", 1)
    @burger = Recipe.new("Burger")
    @burger.add_ingredient(@ground_beef, 4)
    @burger.add_ingredient(@bun, 100)

    @cookbook = CookBook.new
  end

  def test_it_exists
    assert_instance_of CookBook, @cookbook
  end

  def test_it_initiates_empty
    assert_equal [], @cookbook.recipes
  end

  def test_it_can_add_recipes
    @cookbook.add_recipe(@mac_and_cheese)
    @cookbook.add_recipe(@burger)

    expected =[ {:name=>"Mac and Cheese",
                :details=>
                {:ingredients=>[
                  {:ingredient=>"Macaroni", :amount=>"8 oz"},
                  {:ingredient=>"Cheese", :amount=>"2 C"}],
                 :total_calories=>440}},

               {:name=>"Burger",
                :details=>
                {:ingredients=>[
                  {:ingredient=>"Ground Beef", :amount=>"4 oz"},
                  {:ingredient=>"Bun", :amount=>"100 g"}],
                 :total_calories=>500}} ]

    assert_equal expected, @cookbook.summary
  end

end
