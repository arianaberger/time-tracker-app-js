class ProjectsController < ApplicationController

  #add private method and before_action for certain views to get access to @projects

  def index
    if params[:client_id]
      @name = Client.find(params[:client_id]) 
      @projects = @name.projects
    else
      @name = User.find(session[:user_id])
      @projects = @name.projects
    end
  end

  def new
    if params[:client_id]
      @name = Client.find(params[:client_id]) 
    else
      @name = User.find(session[:user_id])
    end
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
    @client = @project.client
  end

  private

  def project_params
    params.require(:project).permit(:name, :deadline, :status, :client_id, :user_id)
  end


end
