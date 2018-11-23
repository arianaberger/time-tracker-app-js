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

#try to fix fb login
# def create
#       if params[:provider] == "google_oauth2"
          
#          user = User.from_omniauth(request.env["omniauth.auth"])
#         session[:user_id] = user.id
#         redirect_to user_path(user)
#      else

#         user = User.find_by(username: params[:username])
        
#         if user && user.authenticate(params[:password])
#             session[:user_id] = user.id
#             redirect_to user_path(user)
#         else
#             render 'new'
#         end
#       end
#     end