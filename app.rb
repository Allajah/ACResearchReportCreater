require 'sinatra'
require 'slim'
require 'sinatra/reloader'
require 'pry'
require 'csv'
get '/' do
  binding.pry
  slim:index
end


get '/:month' do
  @requested_month = params[:month].to_i
  @days = %w(土 日 月 火 水 木 金)
  set_first_day(@requested_month)
  @finalday = set_final_day(@requested_month)
  @objects=CSV.read("csv/#{@requested_month}.csv")
  slim:output
end

def set_first_day(month)
  year = 2015
  date = 1
  # Zeller's congruence
  @first_day_num = (date+(26*(month+1)/10)+year%100+(year%100/4)+5*(year/100)+(year/100/4))%7
end 

def set_final_day(month)
  if month <= 7
    return month%2 == 0 ? 30 : 31
  else
    return month%2 == 0 ? 31 : 30
  end 
end 

def compute_times_of_period
  @objects.each do |obejct|
  end
end
