class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :flats, :address, :address
  end
end
