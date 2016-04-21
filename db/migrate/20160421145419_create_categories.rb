class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :story
      t.string :stand_up
      t.string :instructional
      t.string :review
      t.string :poetry
      t.string :informational
      t.string :teaching
      t.string :persuasive
      t.string :advice
      t.string :thought_provoking
      t.string :impromptu

      t.timestamps null: false
    end
  end
end
