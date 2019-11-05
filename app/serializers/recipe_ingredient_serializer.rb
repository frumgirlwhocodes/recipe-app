class RecipeIngredientSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :ingredient  
  has_one :ingredient
  

  def ingredient 
    object.ingredient.name 
  end 
end
