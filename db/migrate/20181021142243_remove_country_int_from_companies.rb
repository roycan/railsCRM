class RemoveCountryIntFromCompanies < ActiveRecord::Migration[5.1]
  def change
    remove_column :companies, :country, :integer
  end
end
