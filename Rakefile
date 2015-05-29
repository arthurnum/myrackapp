require 'pg'

require "./config.rb"


task :db do
  puts "Database #{MyRackApp::Config::DB_CONFIG[:dbname]}\n"
  connection = PG::connect(MyRackApp::Config::DB_CONFIG)
  query = File.open("./db/schema.sql", 'r').readlines.join
  r = connection.exec(query)
  puts r.res_status(r.result_status)
  connection.close
  puts "Done"
end
