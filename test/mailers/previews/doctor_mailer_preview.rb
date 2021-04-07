# Preview all emails at http://localhost:3000/rails/mailers/doctor_mailer
class DoctorMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/doctor_mailer/appointment_status
  def appointment_status
    DoctorMailer.appointment_status
  end

  # Preview this email at http://localhost:3000/rails/mailers/doctor_mailer/consultation_details
  def consultation_details
    DoctorMailer.consultation_details
  end

end
