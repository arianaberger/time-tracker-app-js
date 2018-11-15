class UsersController < ApplicationController

  def index
    if current_user
      @user = current_user
      @entries = current_user.entries.latest 
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
        render :new 
      end
  end

  def show
    if current_user
      @user = current_user
    else
      redirect_to root_path
    end 
  end

  def update
    @user = current_user.update(:image => params[:image])
    redirect_to user_path(@user)
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
