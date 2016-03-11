require 'sinatra'
require 'sinatra/reloader'

set :port, 9292

number = rand(100)

get '/' do
  erb :index, :locals => {:number => number}
end
