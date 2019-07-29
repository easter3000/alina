class AddImageDataToPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :image_data, :text
    add_column :pictures, :user_id, :integer
  end
end
