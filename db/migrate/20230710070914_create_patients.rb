class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age
      t.integer :mobile
      t.string :email
      t.string :guardian_name
      t.string :address

      t.timestamps
    end
  end
end
