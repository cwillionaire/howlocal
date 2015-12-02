class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :holo_score

      t.timestamps null: false
    end
  end
end
