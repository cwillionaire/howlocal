class AddValuesToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :business, index: true, foreign_key: true
    add_reference :reviews, :user, index: true, foreign_key: true
  end
end
