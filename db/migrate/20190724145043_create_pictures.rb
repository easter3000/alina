class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.references :project
      t.string :name

      t.timestamps
    end
  end
end
