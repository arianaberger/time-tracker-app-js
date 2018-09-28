class ClientsController < ApplicationController

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
      flash[:notice] = "Client created successfully"
      redirect_to client_path(@client)
    else
      render :new
    end
  end

  def show
    @client = Client.find(params[:id])
    @projects = @client.projects
  end

  private

  def client_params
    params.require(:client).permit(:name)
  end

end
