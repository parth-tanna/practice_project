class DoctorMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.doctor_mailer.appointment_status.subject
  #
  def appointment_status(email,status,doctor,time)
    @email=email
    @status=status
    @doctor=doctor
    @time=time
   
    

    mail to: email, subject: "Appointment Status"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.doctor_mailer.consultation_details.subject
  #
  def consultation_details(email,doctor,time,note)
    @email=email
    @note=note
    @doctor=doctor
    @time=time

    mail to: email, subject: "Consultation Details"
  end
end
