class AddCountryIdToCompany < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :country_id, :integer
  end
end
