class Recipe

  attr_reader :name,
              :ingredients,
              :total_calories

  def initialize(name)
    @name = name
    @ingredients = Hash.new
    @total_calories = 0
  end

  def add_ingredient(ingredient, quantity)
    @total_calories += (ingredient.calories * quantity)
    @ingredients[ingredient] = {ingredient.unit => quantity}
  end

  def check_quantity_necessary(ingredient)
    if @ingredients.keys.include?(ingredient)
      @ingredients[ingredient][ingredient.unit]
    else
      "This ingredient isn't necessary for this recipe."
    end
  end

end
