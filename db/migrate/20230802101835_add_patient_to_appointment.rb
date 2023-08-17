class AddPatientToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :patient, foreign_key: true
  end
end
