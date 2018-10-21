# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



require 'csv'


puts "Importing countries..."
CSV.foreach(Rails.root.join("countries.csv"), headers: true) do |row|
  Country.create! do |country|
    # country.id = row[0]
    country.name = row[1]
   end
end


puts "Importing salutations..."
CSV.foreach(Rails.root.join("salutations.csv"), headers: true) do |row|
  Salutation.create! do |salutation|
    salutation.name = row[1]
    salutation.order = row[2]
   end
end




puts "Importing companies..."
CSV.foreach(Rails.root.join("companies.csv"), headers: true) do |row|
  Company.create! do |company|
    company.prename = row[0]
    company.company_name = row[1]
    company.regtype = row[2]
    company.streeta = row[3]
    company.streetb = row[4]
    company.streetc = row[5]
    company.city = row[6]
    company.region = row[7]
    company.postcode = row[8]
	 company.country_id = row[9]
    
    
   end
end




puts "Importing people..."
CSV.foreach(Rails.root.join("people.csv"), headers: true) do |row|
  Person.create! do |person|
    person.salutation_id = row[0]
    person.firstname = row[1]
    person.lastname = row[2]
    person.company_id = row[3]
   end
end




