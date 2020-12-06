# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require "rgeo"
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dir.glob("#{Rails.root}/db/seeds/*.rb").each { |f| require f }


puts "begining to extract and seed data base........."
raw = RawTree.all
tr = Tree.destroy_all
d = Diameter.destroy_all
ty = Type.destroy_all
lo = Location.destroy_all



counter = 0
raw.each do |x|
  

    diameter = Diameter.find_or_create_by({
      dbh_trunk: x["dbh_trunk"],
      total: 0

    })
    type = Type.find_or_create_by({
      common_name: x["common_nam"],
      botanical_name: x["botanical_"],
      total: 0
    })

    location = Location.find_or_create_by ({
                                            # address: 0,
                                            name: x["name"],
                                            total: 0                                            
                                            # geo_id: x["geo_id"],
                                            # x: x["x"],
                                            # y: x["y"],
                                            # struct_id: x["structid"],
                                          })
factory = RGeo::GeoJSON::EntityFactory.instance
feature = factory.feature x["geometry"]
hash = RGeo::GeoJSON.encode feature


# puts "lat: #{hash["geometry"]["coordinates"][0]}"
# puts "long: #{hash["geometry"]["coordinates"][1]}"

    tree = Tree.create({
      common_name: x["common_nam"],
      botanical_name: x["botanical_"],
      dbh_trunk: x["dbh_trunk"],
      address: x["address"],
      name: x["name"],
      tree_posit: x["tree_posit"],
      lat: hash["geometry"]["coordinates"][0],
      long: hash["geometry"]["coordinates"][1],
      type: type,
      location: location,
      diameter: diameter,
    })
    counter = counter + 1
    puts "counter: #{counter}, #{tree.common_name}, #{tree.id} <=@@@@@@@@@"
  end
newtype = Type.all
newlocation = Location.all
newdiameter = Diameter.all 
newtype.each do |x|
puts "111111... "
x.update( total: x.trees.length())
# puts " 1111111#{x.common_name} this is updated, total: #{x.total}"
end

puts "...222222... "
newlocation.each do |x|
x.update( total: x.trees.length())
# puts " 222222222#{x.name} is updated, total: #{x.total}"
end
puts ".....33333333333... "
newdiameter.each do |x|

x.update( total: x.trees.length())
# puts "33333333333 #{x.dbh_trunk} is updated, total: #{x.total}"
end
  puts "......finished!!!"
