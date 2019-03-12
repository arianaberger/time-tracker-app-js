class ProjectsController < ApplicationController
  before_action :current_project, except: [:index, :create, :new, :status, :allprojects]

  def index
    @projects = Project.user_projects(params[:user_id])

######## JS code
    respond_to do |f|
      f.html {render :index}
      f.json {render json: @projects}
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save  #don't need separate .valid? 
      flash[:success] = "Project successfully created!"
      redirect_to @project
    else
      render :new
    end
  end

  def show
    @owner = User.find(@project.owner)
    @entries = @project.entries.desc_order
  end

  def update
    @project.attributes = (project_params)
    if @project.save
      flash[:success] = "Project successfully updated!"
      redirect_to @project
    else
      flash[:alert] = "Project name cannot be blank."
      redirect_to edit_project_path(@project)
    end
  end

  def destroy
    @project.destroy
    flash[:success] = "Project successfully deleted!"
    redirect_to user_projects_path(current_user)
  end

  def status
    @projects = Project.all.status(params[:status])
  end

  def allprojects
    @statuses = Project.new.statuses
  end

  private

  def current_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :deadline, :status, :owner)
  end

end
