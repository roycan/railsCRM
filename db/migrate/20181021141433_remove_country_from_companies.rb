class RemoveCountryFromCompanies < ActiveRecord::Migration[5.1]
  def change
    remove_column :companies, :country, :string
  end
end
