class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :speciality
      t.integer :mobile
      t.string :address
      t.string :experience
      t.integer :registration_number
      t.string :language
      t.integer :consultancy_fee
      t.string :available
      t.string :status

      t.timestamps
    end
  end
end
