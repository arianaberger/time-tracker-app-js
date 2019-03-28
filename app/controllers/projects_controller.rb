class ProjectsController < ApplicationController
  before_action :current_project, except: [:index, :create, :new, :status, :allprojects]

  def index
    @projects = Project.user_projects(current_user)

######## JS code
    respond_to do |f|
      f.html {render :index}
      f.json {render json: @projects}
    end
  end

  def new
    @project = Project.new
    render :new, layout: false
  end

  def create
    @project = Project.new(project_params)
    @owner = User.find(@project.owner)
    if @project.save  
      render :json => {:project => @project, :owner => @owner}, status: 201
    end
  end

  def show
    @project = Project.find(params[:id])
    @owner = User.find(@project.owner)
    @entries = @project.entries.desc_order

######## JS code
    respond_to do |f|
      f.html {render :show}
      # the line below originally provided all the data I need except I can't access the name of the user associated to the entry
      # f.json {render :json => {:project => @project, :owner => @owner, :entries => @entries}}
      f.json {render json: @project}
    end
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
