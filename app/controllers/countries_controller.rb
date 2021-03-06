class CountriesController < ApplicationController

	def index
  	  @countries = Country.all
  	end


		
	def destroy
		# render plain: "Destroy page here "
	  @country = Country.find(params[:id])
	  @country.destroy
	 
	  redirect_to countries_path
	end
		
	
	def edit
		render html: "Edit page here"
	end
	
	def update
		# update data from 'edit' action
	end
	

	
	def show
		# render plain: "Show page here"
		@country = Country.find(params[:id])
	end		
	
	
	def new
		# render plain: "New page here"
	end

	
	## have create action last to accommodate the private method needed for security	
	def create
	  @country = Country.new(country_params)
	 
	  @country.save
	  redirect_to @country
	end
	 
	private
	def country_params
		params.require(:country).permit(:name)
	end	

	
	
	
	
  
end
