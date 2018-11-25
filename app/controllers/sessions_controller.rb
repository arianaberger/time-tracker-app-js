class SessionsController < ApplicationController

  def create
    if auth_hash
      @user = User.find_or_create_by(uid: auth_hash['uid']) do |u|
        u.name= auth_hash['info']['name']
        u.email= auth_hash['info']['email']
        u.password= SecureRandom.hex
      end
      session[:user_id] = @user.id
      redirect_to '/dashboard'
    else
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to '/dashboard'
      else
        flash[:alert] = "Please make sure your email and password are entered correctly."
        redirect_to '/login'
      end
    end
  end

  def destroy
    session.delete :user_id
    flash[:success] = "You have successfully logged out!"
    redirect_to '/'
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

end
