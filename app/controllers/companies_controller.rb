class CompaniesController < ApplicationController


	# place on top part of the controller
  http_basic_authenticate_with name: "", password: "", except: [:index, :show, :new, :create]
	

	
	def index
  	  @companies = Company.all
  	end
		

			
	
	def destroy
		# render plain: "Destroy page here "
	  @company = Company.find(params[:id])
	  @company.destroy
	 
	  redirect_to companies_path
	end
		
	
	
	def edit
		# render plain: "Edit page here"
		@company = Company.find(params[:id])
	end
	
			
	def update
		#render plain: "Update page here"
	  @company = Company.find(params[:id])
	 
	  if @company.update(company_params)
	    redirect_to @company
	  else
	    render 'edit'
	  end		
			
	end

	

	
	def show
		# render plain: "Show page here"
		@company = Company.find(params[:id])
		@person = Person.new
	end		
	

	def new
		# render plain: "New page here"
		@company = Company.new
	end

	
	## have create action last to accommodate the private method needed for security	
	def create
	  @company = Company.new(company_params)
	 
	  if @company.save
	    redirect_to @company
	  else
	    render 'new'
	  end
	end

	 
	private
	def company_params
		params.require(:company).permit(:prename, :company_name, 
			:regtype , :streeta , :streetb, :streetc, :city, 
			:region, :postcode, :country_id )
	end	

	


end
