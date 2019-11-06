class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :directions, :cook_time, :description 
  has_one  :user 
  has_many :comments 
  has_many :recipe_ingredients
end
