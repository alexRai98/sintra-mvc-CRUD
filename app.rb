require "sinatra"
require "sinatra/reloader" if development?
require "lazyrecord"
require_relative "model/task"
require_relative "helpers/task_helper"

helpers TaskHelper
use Rack::MethodOverride
get "/"do
  redirect url("/tasks")
end
get "/tasks" do
  @task = Task.all
  erb :index
end

post "/tasks" do
  text = params[:text]
  Task.create(text)
  redirect url("/") 
end

post "/tasks/:id/complete" do
  id = params[:id].to_i
  task = Task.find(id)
  task.complete!
  redirect url("/tasks")
end

post "/tasks/:id/uncomplete" do
  id = params[:id].to_i
  task = Task.find(id)
  task.uncomplete!
  redirect url("/tasks")
end

delete "/tasks/:id" do
  id = params[:id].to_i
  Task.delete(id)
  redirect url("/tasks")
end