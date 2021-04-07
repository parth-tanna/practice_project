class User < ApplicationRecord

  has_many :patient_appointments, class_name: "Appointment",
                                  foreign_key: "patient_id",
                                  dependent: :destroy
 

  has_many :doctor_appointments, class_name: "Appointment",
                                          foreign_key: "doctor_id",
                                          dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :mobile_number, presence: true, length: { is: 10 }
  validates :address, presence: true, length: { in: 6..300 }
  validates :role, presence: true

  def show_appointment
    #doctor_ids = "SELECT doctor_id FROM appointments
                        #WHERE patient_id = :patient_id}"
    #Appointment.where(patient_id:1)
                        
  end

  
end


