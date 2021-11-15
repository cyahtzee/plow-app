class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :category
      t.string :description
      t.string :title
      t.string :condition
      t.integer :price_per_day
      t.string :location
      t.string :size
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
