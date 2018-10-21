class PeopleController < ApplicationController

	# place on top part of the controller
	http_basic_authenticate_with name: "", password: "", only: :destroy




	def index
  	  @people = Person.all
  	  @salutations = Salutation.all
  	end
	
					 
  def destroy
    @company = Company.find(params[:company_id])
    @person = @company.people.find(params[:id])
    @person.destroy
    redirect_to company_path(@company)
  end
	


	
	def edit
		# render plain: "Edit page here"
		@person = Person.find(params[:id])
	end
	
			
	def update
		#render plain: "Update page here"
	  @person = Person.find(params[:id])
	 
	  if @person.update(person_params)
	    redirect_to @person
	  else
	    render 'edit'
	  end		
			
	end

	



	
	def show
		# render plain: "Show page here"
		@person = Person.find(params[:id])
	end		
	
	
	def new
		# render plain: "New page here"
		#@person = Person.new
	end

	
  def create
  	 # render plain: "Create page here"
    # @company = Company.find(params[:company_id])
    # @salutation = Salutation.find(params[:salutation_id])
    @person = Person.new(person_params)
   
    
     if @person.save
	    redirect_to @person
	  else
	    #render 'new'
	    redirect_to @company
	  end
  end
  
  private
    def person_params
      params.require(:person).permit(:salutation_id, :firstname, :lastname, :company_id)
    end




	



end
