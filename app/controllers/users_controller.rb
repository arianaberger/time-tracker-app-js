class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to '/dashboard'
    else
      redirect_to '/signup' #add error message to form if fields are missing
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :title, :email, :password, :password_confirmation)
  end


end
