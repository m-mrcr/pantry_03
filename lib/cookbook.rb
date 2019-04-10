class CookBook

  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes.push(recipe)
  end

  def summary
    formatted = []
    @recipes.each do |recipe|
      format = Hash.new
      format[:name] = recipe.name
      format[:details] = Hash.new
      format[:details][:ingredients] = next
      next = recipe.ingredients.each do |ingredient|
        format[:details][:ingredients][:ingredient] = ingredient[0].name
        format[:details][:ingredients][:amount] = "#{ingredient[1].flatten[1]} #{ingredient[1].flatten[0]}"
      end
      format[:details][:total_calories] = recipe.total_calories
      formatted.push(format)
    end
    formatted.sort_by{|recipe| recipe[:details][:total_calories]}
  end

end
