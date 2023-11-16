class CreateHouses < ActiveRecord::Migration[7.1]
  def change
    create_table :houses do |t|
      t.string :address
      t.integer :resident_id

      t.timestamps
    end
  end
end
