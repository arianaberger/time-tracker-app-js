class UsersController < ApplicationController

  def show
    if current_user
      @user = current_user
      @entries = Entry.latest
    else
      redirect_to root_path
    end
  end

  def create
      @user = User.new(user_params)
      if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect_to '/dashboard'
      else
        flash[:notice] = "Please fill out all fields."
        redirect_to '/signup' 
      end
  end


  private

  def user_params
    params.require(:user).permit(:name, :title, :email, :password, :password_confirmation)
  end


end
