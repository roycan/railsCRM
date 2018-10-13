class Company < ApplicationRecord


	##these goes to the models
	# belongs_to :company
			
	has_many :people, dependent: :destroy


		
	validates :company_name, presence: true,
	                    length: { minimum: 5 }



end
