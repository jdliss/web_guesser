require 'sinatra'
require 'sinatra/reloader'

set :port, 9292

num = rand(100)
get '/' do
  "The SECRET NUMBER IS #{num}"
end
