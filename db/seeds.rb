# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Diseases_1.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
ActiveRecord::Base.connection.execute("TRUNCATE TABLE Diseases RESTART IDENTITY;")
csv.each do |row|	
  t = Disease.new
  t.name = row['Name']
  t.id = row['Id']
  t.save
  p t
end

puts "There are now #{Disease.count} rows in the Diseases table"
