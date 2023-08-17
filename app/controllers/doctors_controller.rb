 class DoctorsController < ApplicationController
  # before_action :set_doctor, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @doctors = Doctor.all 
  end

  def about
  end
  def new
    @doctor = Doctor.new
    #@doctor = current_user.doctors.new(user_id: params[:current_user])
  end

  def create 
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to @doctor
    else
      render :new, status: :unprocessable_entity
    end  
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_params)
      redirect_to @doctor, notice: 'Doctor has been updated successfully'
    else
      render :edit 
    end
  end 


  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    redirect_to doctors_path, status: :see_other
  end
  private
    def doctor_params
      params.require(:doctor).permit( :name, :speciality, :mobile, :address, :status, :language, :consultancy_fee, :registration_number, :available, :experience, :user_id, :image)
    end
end
    