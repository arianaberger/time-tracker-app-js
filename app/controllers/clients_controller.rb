class ClientsController < ApplicationController
    before_action :current_client, except: [:index, :new, :create]

  def index
    @clients = Client.all
    @user = current_user
  end

  def new
    @user = current_user
  end

  def create
    @client = Client.new(client_params)
    if @client.valid?
      @client.save
      flash[:notice] = "Client created successfully!"
      redirect_to client_path(@client)
    else
      render :new
    end
  end

  def show
    @projects = @client.projects
  end

  def destroy
    @client.destroy
    flash[:notice] = "Client successfully deleted!"
    redirect_to clients_path
  end

  private

  def current_client
    @client = Client.find(params[:id])
  end


  def client_params
    params.require(:client).permit(:name, :user_id)
  end

end
