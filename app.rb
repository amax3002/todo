require "sinatra"
require "./db/connection"

get "/" do
  erb :"home/index.html", layout: :"layout/application.html"
end

get "/tasks" do
  @tasks = Task.all
  erb :"tasks/index.html", layout: :"layout/application.html"
end

get "/tasks/:name" do
  @tasks = Task.find_by(name: params["name"])
  if @task.save
    redirect "/tasks"
  else
    status(404)
    { message: "Task #{params["name"]} not found!" }.to_json
  end
end

post "/tasks" do
  @task = Task.new(params)
  if @task.save
    redirect "/tasks"
  else
    erb :"tasks/new.html", layout: :"layout/application.html"
  end

  get "/tasks/new" do
    @task = Task.new
    erb :"tasks/new.html", layout: :"layout/application.html"
  end
end
