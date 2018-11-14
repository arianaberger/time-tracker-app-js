class EntriesController < ApplicationController

	def index
		@entries = current_user.entries.desc_order
	end

	def new
		@entry = Entry.new
	end

	def create
		entry = Entry.new(entry_params)
		if entry.valid?
			entry.save
			flash[:notice] = "Time entry successfully saved."
			redirect_to user_entries_path(current_user)
		else
	        flash[:notice] = "Please include a note with your time entry."
	        redirect_to new_user_entry_path(current_user)
	    end
	end

	def destroy
		Entry.find(params[:id]).destroy
		redirect_to entries_path
	end

	private

	def entry_params
		params.require(:entry).permit(:date, :start_time, :end_time, :notes, :user_id, :project_id)
	end


end
