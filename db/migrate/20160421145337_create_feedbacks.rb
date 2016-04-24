class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :presentation_id
      t.string :rating
      t.string :comment

      t.timestamps null: false
    end
  end
end
