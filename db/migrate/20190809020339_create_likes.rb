class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.boolean :like
      t.integer :user_id
      t.integer :recipe_id
    end
  end
end
