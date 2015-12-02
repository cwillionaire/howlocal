class AddHoloScoreToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :holo_score, :float
  end
end
