class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :patient_name
      t.integer :age
      t.string :gender
      t.string :guardians_name
      t.integer :contact
      t.string :email
      t.string :address
      t.string :doctor_name
      t.integer :consultancy_fee
      t.integer :doctor_id
      t.string :speciality
      t.date :appointment_date
      t.time :appointment_time

      t.timestamps
    end
  end
end
