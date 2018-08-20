class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      # t.belongs_to:shop, index: true

      t.string :title
      t.text :description
      t.integer :price
      t.integer :purchasing_price
      t.text :image
      t.text :catagory
      t.string :Shop

      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
