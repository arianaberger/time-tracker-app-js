class ClientsController < ApplicationController

  def new
  end

  def create
    @client = Client.new(client_params)
    if @client.valid?
      @client.save
      redirect_to client_path(@client)
    else
      #add error to say 'name must be filled out'?
      render :new
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  private

  def client_params
    params.require(:client).permit(:name)
  end

end
