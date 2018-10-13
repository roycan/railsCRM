class PeopleController < ApplicationController

	# place on top part of the controller
	http_basic_authenticate_with name: "", password: "", only: :destroy



	def index
		render html: "Index page here"
	end
	

					 
  def destroy
    @company = Company.find(params[:company_id])
    @person = @company.people.find(params[:id])
    @person.destroy
    redirect_to company_path(@company)
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
  	 # render plain: "Create page here"
    @company = Company.find(params[:company_id])
    @person = @company.people.create(person_params)
    redirect_to company_path(@company)
  end
  
  private
    def person_params
      params.require(:person).permit(:salutation, :firstname, :lastname)
    end




end