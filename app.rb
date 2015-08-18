require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/task")
require("./lib/list")
require("pg")

DB = PG.connect({:dbname => "to_do_test"})

get('/') do
  erb(:index)
end

get('/list') do
  @lists = List.all()
  erb(:all_lists)
end

get('/list_form') do
  erb(:list_form)
end

post('/list/new') do
  list_name = params.fetch("new_list")
  list = List.new({:name => list_name, :id => nil})
  list.save()
  reroute('/list')
end
