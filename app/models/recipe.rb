class Recipe < ApplicationRecord
    
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    belongs_to :user 
    has_many :comments 

    validates :name, presence: true 
    validates :name, uniqueness: true
    
   
    accepts_nested_attributes_for :ingredients 
    accepts_nested_attributes_for :recipe_ingredients 

    def ingredients_to_recipe(params)
      
      params[:recipe_ingredients_attributes].each do |k, recipe_ingredient|
  
        if recipe_ingredient[:ingredient][:name].present?
           recipe_ingredient[:ingredient][:name]
          ingredient = Ingredient.find_or_create_by(name: recipe_ingredient[:ingredient][:name])
        elsif recipe_ingredient[:ingredient_id].present?
          ingredient = Ingredient.find_by(id: recipe_ingredient[:ingredient_id])
        end
  
        if recipe_ingredient[:quantity].present?
          RecipeIngredient.create(quantity: recipe_ingredient[:quantity], ingredient_id: ingredient.id, recipe_id: self.id )
        end
  
      end
  
    end


 

    def self.recently_added_recipes
        Recipe.last(4).reverse
         end

    
end
