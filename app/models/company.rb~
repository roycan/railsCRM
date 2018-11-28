class Company < ApplicationRecord


	##these goes to the models
	# belongs_to :company
			
	has_many :people, dependent: :destroy

	belongs_to :country

		
	validates :company_name, presence: true,
	                    length: { minimum: 4 }



end
