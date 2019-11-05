class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :directions, :cook_time 
  
  belongs_to :user 
  has_many :comments 
  has_many :recipe_ingredients
end
