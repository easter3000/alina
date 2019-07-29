class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.text :name
      t.date :date_of_creation
      t.string :city
      t.references :user

      t.timestamps
    end
  end
end
