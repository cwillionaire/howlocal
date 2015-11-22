class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.references :review, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :name
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
