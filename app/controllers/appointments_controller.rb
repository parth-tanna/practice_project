class AppointmentsController < ApplicationController

  before_action :user_patient, only: [:new,:create]

  def new
    @appointment=current_user.patient_appointments.build()
    
    
  end

  def create
    @appointment = current_user.patient_appointments.build(appointment_params)
    #@appointment = Appointment.new(appointment_params)
    @appointment.doctor_id=params[:doctor_id]
    
    if @appointment.save
      #user=current_user.patient_pending_appointments.find_by(doctor_id:params[:doctor_id])
      #user=User.find(params[:doctor_id])
      
      
      
      #current_user.book_appointment(user)
     
      flash[:success] = "Appointment created!"
      redirect_to user_path(current_user)
    else
      flash[:error] = "Appointment not created!"
      
      @id=params[:doctor_id]
      render 'new'
    end
    
  end
=begin
  def show
    if current_user.role=="Patient"
      @doctors=current_user.patient_appointments
      

      
      
      
    else
      @appointment=Appointment.find_by(doctor_id:current_user.id)
      @user_appointment=User.find(@appointment.doctor_id)
    end

  end
=end
def user_patient
  if current_user.role!="Patient"
      flash[:info]="Sorry You are not allowed to book appointment."
      redirect_to user_path(current_user)
  end
end
def current_user?(user)
  user && user == current_user
end

private
  def appointment_params
    params.require(:appointment).permit(:doctor_id,:patient_id,:reason,:time_slot)
  end
end
