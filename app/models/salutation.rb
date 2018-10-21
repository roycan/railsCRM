class Salutation < ApplicationRecord

	
	##these goes to the models
	# belongs_to :salutation
			
	has_many :people, dependent: :destroy


end
