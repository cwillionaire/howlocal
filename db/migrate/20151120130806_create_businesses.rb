class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.references :review_id, index: true, foreign_key: true
      t.references :user_id, index: true, foreign_key: true
      t.strng :name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip
      t.float :average_rating
      t.string :description

      t.timestamps null: false
    end
  end
end
