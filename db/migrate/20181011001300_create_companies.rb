class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :prename
      t.string :company_name
      t.string :regtype
      t.string :streeta
      t.string :streetb
      t.string :streetc
      t.string :city
      t.string :region
      t.string :postcode
      t.string :country

      t.timestamps
    end
  end
end
