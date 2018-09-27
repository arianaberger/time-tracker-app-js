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
    @project = Project.new
  end

  def create
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

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to @project
  end

  private

  def project_params
    params.require(:project).permit(:name, :deadline, :status, :client_id, :user_id)
  end


end
