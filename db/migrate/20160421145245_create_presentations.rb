class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :video
      t.integer :upvotes
      t.integer :views
      t.string :goal
      t.integer :accomplished
      t.integer :user_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
