class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    before_action :user_patient, only: [:show_doctors]
    before_action :correct_user, except: [:index]
    before_action :user_doctor, only: [:add_note,:status_mail]
    

    attr_accessor :user
    
    def index
        @users = User.all
    end

    def show
        @user=User.find(params[:id])
    end

    def destroy
         
    end
    def show_doctors
        @doctors = User.where(role: "Doctor")

    end

    def show_appointments
        if current_user.role=="Patient"
            @doctors_appointment=current_user.patient_appointments.where('time_slot >= ? AND (status ="Confirm" OR status IS NULL)',Date.today)
        else
            @patients_appointment=current_user.doctor_appointments.where('time_slot >= ? AND (status ="Confirm" OR status IS NULL)',Date.today)
        end
    end

    def user_patient
        if current_user.role!="Patient" && !current_user?(current_user)
            flash[:info]="Sorry You are not allowed"
            redirect_to user_path(current_user)
        end
    end

    def user_doctor
        if current_user.role!="Doctor" && !current_user?(current_user)
            flash[:info]="Sorry You are not allowed"
            redirect_to user_path(current_user)
        end
    end
    def correct_user
        if !current_user?(current_user)
            flash[:info]="Sorry You are not allowed"
            redirect_to user_path(current_user)
        end
    end
    
    def current_user?(user)
        user && user == current_user
    end

    def status_mail
        DoctorMailer.appointment_status(params[:email],params[:status],params[:doctor],params[:time]).deliver_now
        appointment=Appointment.find_by(doctor_id: params[:doctor_id],time_slot: params[:time])
        appointment.update_attribute(:status,params[:status])
        
        flash[:info] = "Successfully Sent email to patient and its status."
        redirect_to root_url
        
    end
    def add_note
        
        DoctorMailer.consultation_details(params[:email],params[:doctor],params[:time],params[:add_note]).deliver_now
        flash[:info] = "Successfully Sent  your note."
        redirect_to root_url


    end

end
