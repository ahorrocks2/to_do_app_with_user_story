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

get('/list/:id') do
  @list = List.find(params.fetch("id").to_i)
  erb(:task_form)
end

post('/list/new') do
  list_name = params.fetch("new_list")
  list = List.new({:name => list_name, :id => nil})
  list.save()
  redirect('/list')
end

post('/task/new') do
  @list = List.find(params.fetch("list_id").to_i)
  task_description = params.fetch("new_task")
  list_id = params.fetch("list_id")
  task = Task.new({:description => task_description, :list_id => list_id})
  task.save()
  redirect('/list/' + @list.id().to_s())
end
