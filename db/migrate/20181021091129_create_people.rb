class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.integer :salutation_id
      t.string :firstname
      t.string :lastname
      t.integer :company_id
      t.references :salutation, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
