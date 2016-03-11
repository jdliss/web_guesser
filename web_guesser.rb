require 'sinatra'
require 'sinatra/reloader'

set :port, 9292

number = rand(100) + 1
get '/' do
  message = check_guess(params["guess"].to_i, number)
  erb :index, :locals => {:number => number, :message => message}
end

def check_guess(guess, number)
  if guess <= 0
    "Guess a number between 1-100"
  elsif guess == number
    "You win!"
  elsif number - guess <= -5
    "Way too high"
  elsif guess > number
    "Too high"
  elsif number - guess >= 5
    "Way too low"
  else
    "Too low"
  end
end
