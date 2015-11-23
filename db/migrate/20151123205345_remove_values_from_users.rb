class RemoveValuesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :admin, :boolean
    remove_column :users, :busi_own, :boolean
  end
end
