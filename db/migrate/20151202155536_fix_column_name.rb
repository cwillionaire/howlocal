class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :reviews, :holo_score, :user_rating 
  end
end
