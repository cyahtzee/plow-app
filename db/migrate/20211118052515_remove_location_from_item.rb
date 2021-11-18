class RemoveLocationFromItem < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :location, :string
  end
end
