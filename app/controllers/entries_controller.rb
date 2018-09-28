class EntriesController < ApplicationController

	def index
		@entries = Entry.all
	end

	def new
		@entry = Entry.new
	end

	def create
		raise params.inspect
		@entry = Entry.new(entry_params)
		if @entry.save?
			flash[:notice] = "Time entry successfully saved."
			redirect_to entries_path
		else
			render :new
		end
	end

	private

	def entry_params
		params.require(:entry).permit(:date, :start_time, :end_time, :notes, :user_id)
	end


end
