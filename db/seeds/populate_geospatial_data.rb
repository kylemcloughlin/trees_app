puts "Deleting all previous geographical data...beep beep"

connection = ActiveRecord::Base.connection()


trees = Tree.delete_all

connection.execute "ALTER SEQUENCE diameters_id_seq RESTART WITH 1"
connection.execute "ALTER SEQUENCE types_id_seq RESTART WITH 1"
connection.execute "ALTER SEQUENCE locations_id_seq RESTART WITH 1"
connection.execute "ALTER SEQUENCE trees_id_seq RESTART WITH 1"



puts
puts "Trees.??? #{trees}"
if Tree.all.count == 0
  puts "Importing data for Toronto Street Trees....."
  from_toronto__sql = `shp2pgsql -c -g geometry -W LATIN1 -s 4326 s3://torontostreettrees-assets/shapefiles/TMMS_Open_Data_WGS84.shp raw_trees`
  # from_toronto_shp_sql = `shp2pgsql -c -g geometry -W LATIN1 -s 4326 #{Rails.root.join("db", "shapefiles", "TMMS_Open_Data_WGS84.shp")} raw_trees`
  connection.execute "drop table if exists raw_trees"
  connection.execute from_toronto_shp_sql

  puts "done?!?!? Importing data for Toronto Street Trees....."  
 
end
