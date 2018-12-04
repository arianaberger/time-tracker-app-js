class EntriesController < ApplicationController

	def index
		if !params[:project].blank?
		  @entries = current_user.entries.sort_by_project(params[:project])
		else
		  @entries = current_user.entries.desc_order
		end
		@project = Project.all
	end

	def new
		@entry = Entry.new
		if params[:project_id]
			@selected = Project.find(params[:project_id]).id
		else
			@selected = Project.first.id
		end
	end

	def create
		@entry = Entry.new(entry_params)
		if @entry.valid?
			@entry.save
			flash[:success] = "Time entry successfully saved."
			redirect_to project_path(params[:entry][:project_id])
		else
	        render :new
	    end
	end

	def destroy
		entry = Entry.find(params[:id])
		entry.destroy
        flash[:success] = "Time entry successfully deleted."
		redirect_to project_path(entry.project.id)
	end

	private

	def entry_params
		params.require(:entry).permit(:date, :start_time, :end_time, :notes, :user_id, :project_id)
	end


end
