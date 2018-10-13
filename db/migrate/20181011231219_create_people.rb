class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :salutation
      t.string :firstname
      t.string :lastname
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
