class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :recipe_id 
      t.integer :user_id 
      t.timestamp 
    end
  end
end
