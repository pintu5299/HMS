class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  
  # after_action :create_patient, only: [:create]
  def index
    @doctor = Doctor.find(params[:doctor_id])
    @appointments = @doctor.appointments
    end

  def new
    # @appointment = Appointment.new(doctor_id: params[:doctor_id], doctor_name: params[:doctor_name], user_id: params[:user_id], consultancy_fee: params[:consultancy_fee])
    @appointment = Appointment.new(doctor_name: params[:doctor_name], user_id: params[:user_id], consultancy_fee: params[:consultancy_fee], speciality: params[:speciality], doctor_id: params[:doctor_id])
  end
  
  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to @appointment
    else
      render :new, status: :unprocessable_entity
    end  
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def edit
    @appointment= Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id]) 
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: 'Appointment has been updated successfully'
    else
      render :edit
    end
  end 


  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

   redirect_to doctors_path, status: :see_other
  end
  private
    def appointment_params
      params.require(:appointment).permit(:patient_name, :patient_id, :age, :gender, :guardian_name, :speciality, :email, :contact, :doctor_name, :consultancy_fee, :appointment_date, :appointment_time, :address, :doctor_id, :image, :user_id)
    end

    # def create_patient
    #   patient_name :@appointment.name,
      
    # end
end
    
