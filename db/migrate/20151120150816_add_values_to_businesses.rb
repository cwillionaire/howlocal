class AddValuesToBusinesses < ActiveRecord::Migration
  def change
    add_reference :businesses, :review, index: true, foreign_key: true
    add_reference :businesses, :user, index: true, foreign_key: true
  end
end
