class ProjectsController < ApplicationController
  before_action :current_project, except: [:index, :create, :new]

  def index
    @user = User.find(session[:user_id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
      if @project.valid? #this doesn't even have any validations yet!
        @project.save
        flash[:notice] = "Project successfully created!"
        redirect_to @project
      else
        render :new
      end
  end

  def show
    @owner = User.find(@project.owner)
    @entries = Project.find(params[:id]).entries
  end

  def update
    @project.update(project_params)
    redirect_to @project
  end

  def destroy
    @project.destroy
    flash[:notice] = "Project successfully deleted!"
    redirect_to user_projects_path(current_user)
  end

  private

  def current_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :deadline, :status, :owner)
  end

end
