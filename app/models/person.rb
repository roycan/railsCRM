class Person < ApplicationRecord
  belongs_to :company
  has_one :salutation ,  dependent :destroy
end
