class SalutationsController < ApplicationController


		
	def index
  	  @salutations = Salutation.all
  	end
	
	
	def destroy
		# uses method :delete
	end
	
	def edit
		render html: "Edit page here"
	end
	
	def update
		# update data from 'edit' action
	end
	
	def show
		render html: "Show page here"
	end	
	
	def new
		render html: "New page here"
	end
	
	def create
		render html: "Create page here"
	end
	


end
