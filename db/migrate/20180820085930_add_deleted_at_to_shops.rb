class AddDeletedAtToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :deleted_at, :datatime
    add_index :shops, :deleted_at
  end
end
