require 'sinatra'
require 'sinatra/reloader'

set :port, 9292

number = rand(100) + 1
get '/' do
  @color = "red"
  message = check_guess(params["guess"].to_i, number)
  erb :index, :locals => {:number => number, :message => message, :color => @color}
end

def check_guess(guess, number)
  if guess <= 0
    color = "white"
    "Guess a number between 1-100"
  elsif guess == number
    @color = "green"
    "You win!\nThe SECRET NUMBER was #{guess}"
  elsif number - guess <= -5
    @color = "red"
    "Way too high"
  elsif guess > number
    @color = "pink"
    "Too high"
  elsif number - guess >= 5
    @color = "red"
    "Way too low"
  else
    @color = "pink"
    "Too low"
  end
end
