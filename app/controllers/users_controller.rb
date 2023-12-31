class UsersController < ApplicationController
  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_url, notice: 'User has been updated successfully'
    else
      render :edit
    end
  end 

 def index
  @users = User.order(created_at: :desc)
  end

 private 
   def user_params
   	 params.require(:user).permit(:role_id)
   	end
end

