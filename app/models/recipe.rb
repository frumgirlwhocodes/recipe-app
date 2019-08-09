class Recipe < ApplicationRecord
    has_many :recipe_ingredients 
    has_many :ingredients, through: :recipe_ingredients 
    belongs_to :user 
    has_many :comments 

    validate :name, presence: true 
    validates :name, uniqueness: true
    validates :recipe_ingredients, presence: true
end
