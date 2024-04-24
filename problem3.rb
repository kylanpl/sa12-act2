require 'httparty'
require 'json'

area = 'Europe'
location = 'London'

response = HTTParty.get("http://worldtimeapi.org/api/timezone/#{area}/#{location}")
time_data = JSON.parse(response.body)

date = time_data['datetime'].split('T')[0]
time = time_data['datetime'].split('T')[1].split('.')[0]

puts "The current time in #{area}/#{location} is #{date} #{time}"
