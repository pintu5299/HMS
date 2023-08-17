class PatientsController < ApplicationController
	before_action :authenticate_user!
	def index
    @patients = Patient.all 
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to @patient 	
    else
      render :new, status: :unprocessable_entity
    end  
  end

	def show
	    @patient = Patient.find(params[:id])
	  end

	  def edit
	    @patient = Patient.find(params[:id])
	  end

	  
  def update
    @patient = Patient.find(params[:id])

    if @patient.update(patient_params)
      redirect_to @patient, notice: 'Patient has been updated successfully'
    else
      render :edit
    end
  end 


	  def destroy
	    @patient = Patient.find(params[:id])
	    @patient.destroy

	   redirect_to patients_path, status: :see_other
	  end
	  private
	    def patient_params
	      params.require(:patient).permit(:name, :age, :guardian_name, :mobile, :email, :address)
	    end 
	 end
