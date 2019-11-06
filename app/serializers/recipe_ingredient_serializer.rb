class RecipeIngredientSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :ingredient  
 
  has_one :ingredient
  has_one :recipe 
  

  def ingredient 
    object.ingredient.name 
  end 
end
