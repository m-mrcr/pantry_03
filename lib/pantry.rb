class Pantry

  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end

  def enough_ingredients_for?(recipe)
    result = Hash.new(false)
    recipe.ingredients.each do |item|
      result[item] = @stock[item[0]] >= item[1][item[0].unit]
    end
    result.all?{|item| item[1] == true}
  end

end
