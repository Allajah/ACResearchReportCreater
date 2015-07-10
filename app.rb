require 'sinatra'
require 'slim'
require 'sinatra/reloader'
require 'pry'
require 'csv'
get '/' do
  binding.pry
  slim:index
end

get '/June' do
  @objects=CSV.read('csv/June.csv')
  slim:June
  #binding.pry
end
