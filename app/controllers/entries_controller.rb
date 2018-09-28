class EntriesController < ApplicationController

	def index
		@entries = Entry.all.order("created_at DESC")
	end

	def new
		@entry = Entry.new
	end

	def create
		entry = Entry.create(entry_params)
		flash[:notice] = "Time entry successfully saved."
		redirect_to entries_path
	end

	private

	def entry_params
		params.require(:entry).permit(:date, :start_time, :end_time, :notes, :user_id, :project_id)
	end


end
