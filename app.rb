require "sinatra"
require "./db/connection"

get "/" do
  erb :"home/index.html", layout: :"layout/application.html"
end

get "/tasks" do
  @tasks = Task.all
  erb :"tasks/index.html", layout: :"layout/application.html"
end

get "/tasks/new" do
  @task = Task.new
  erb :"tasks/new.html", layout: :"layout/application.html"
end

get "/tasks/:id" do
  @task = Task.find(params["id"])
  erb :"tasks/show.html", layout: :"layout/application.html"
end

get "/tasks/:name" do
  @task = Task.find_by(name: params["name"])
  if @task.save
    redirect "/tasks"
  else
    status(404)
    { message: "Task #{params["name"]} not found!" }.to_json
  end
end

post "/tasks" do
  @task = Task.new(params)
  @task.complete = false
  if @task.save
    redirect "/tasks"
  else
    erb :"tasks/new.html", layout: :"layout/application.html"
  end
end

get "/tasks/:id/edit" do
  @task = Task.find(params["id"])
  erb :"tasks/edit.html", layout: :"layout/application.html"
end

patch "/tasks/:id" do
  @task = Task.find(params["id"])
  @task.update(params["task"])
  redirect "/tasks"
end

delete "/tasks/:id" do
  @task = Task.find(params["id"])
  @task.destroy
  redirect "/tasks"
end

post "/tasks/search" do
  @tasks = Task.where("name LIKE ?", "%#{params['q']}%")
  erb :"tasks/index.html", layout: :"layout/application.html"
end

post "/next" do
  @tasks = Task.where({"complete" => false}).sample
  @tasks = [@tasks]
  erb :"tasks/index.html", layout: :"layout/application.html"
end
