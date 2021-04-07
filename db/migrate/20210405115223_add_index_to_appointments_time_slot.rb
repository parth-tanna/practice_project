class AddIndexToAppointmentsTimeSlot < ActiveRecord::Migration[6.0]
  def change
    add_index :appointments, [:time_slot,:doctor_id], unique: true
  end
end
