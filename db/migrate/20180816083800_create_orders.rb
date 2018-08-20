class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      # t.belongs_to: 
      t.string :status

      t.references :shop, foreign_key: true
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
