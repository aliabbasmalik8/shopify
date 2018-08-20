class CreateShops < ActiveRecord::Migration[5.2]
  def change    
    create_table :shops do |t|
      
      t.string :name
      t.text :description
      t.text :catagory
      t.text :sweet_line
      t.text :logo

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
