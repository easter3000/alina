class CreatePotentialClients < ActiveRecord::Migration[5.2]
  def change
    create_table :potential_clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
