class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :directions 
      t.string :cook_time
      t.integer :user_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
