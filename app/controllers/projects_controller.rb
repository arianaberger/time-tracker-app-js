class ProjectsController < ApplicationController

  def new
    @client = Client.find(params[:client_id])
  end

  def create
    
  end

end
