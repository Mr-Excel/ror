class ChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    rename_column :images, :url, :image_data
    change_column :images, :image_data, :text
  end
end
