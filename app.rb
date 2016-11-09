require "sinatra"
require "./db/connection"

get "/" do
  erb :"home/index.html", layout: :"layout/application.html"
end

get "/tasks" do
  @tasks = Task.all
  erb :"tasks/index.html", layout: :"layout/application.html"
end

post "/tasks" do
  @task = Task.new(params)
  if @task.save
    redirect "/tasks"
  else
    erb :"tasks/new.html", layout: :"layout/application.html"
  end
end
