require 'httparty'
require 'json'

response = HTTParty.get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd')
data = JSON.parse(response.body)

sorted_data = data.sort_by { |currency| currency['market_cap'] }
sorted_data.reverse!

puts 'Top 5 Cryptocurrencies by Market Capitalization:'
sorted_data.first(5).each do |currency|
  puts "Name: #{currency['name']}"
  puts "Current Price: $#{currency['current_price']}"
  puts "Market Cap: $#{currency['market_cap']}"
  puts '---'
end
