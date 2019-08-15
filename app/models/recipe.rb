class Recipe < ApplicationRecord
    
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    belongs_to :user 
    has_many :comments 

    validates :name, presence: true 
    validates :name, uniqueness: true
    validates :recipe_ingredients, presence: true
   
    accepts_nested_attributes_for :ingredients 

    def ingredients_attributes=(ingredient_attributes)
        ingredient_attributes.values.each do |ingredient_attributes|
          ingredient = Ingredient.find_or_create_by(ingredient_attributes)
          self.ingredients << ingredient 
        end
      end

 

    def self.recently_added_recipes
        Recipe.last(4).reverse
         end

    
end
