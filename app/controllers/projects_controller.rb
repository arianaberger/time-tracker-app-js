class ProjectsController < ApplicationController

  def new
    @client = Client.find(params[:client_id])
  end

  def create
    raise params.inspect
  end

end
