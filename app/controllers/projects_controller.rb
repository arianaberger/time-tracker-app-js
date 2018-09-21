class ProjectsController < ApplicationController

  def new
    @client = Client.find(params[:client_id])
  end

  def create
    # raise params.inspect
    @project = Project.new(project_params)
      if @project.valid?
        @project.save
        flash[:notice] = "Project successfully created"
        redirect_to @project
      else
        render :new
      end
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name, :deadline, :status, :client_id, :user_id)
  end


end
