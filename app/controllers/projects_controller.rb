class ProjectsController < ApplicationController

  def new
    @client = Client.find(params[:client_id])
  end

  def create
    raise params.inspect
  end

  private

  def project_params
    params.require(:project).permit(:name, :deadline, :status)
  end


end
