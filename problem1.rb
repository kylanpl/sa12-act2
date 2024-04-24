require 'httparty'
require 'json'

username = 'Benature'
response = HTTParty.get("https://api.github.com/users/#{username}/repos")
repos = JSON.parse(response.body)

most_starred_repo = repos.max_by do |repo|
  repo['stargazers_count']
end
puts "Most starred repo:"
puts "Name: #{most_starred_repo['name']}"
puts "Description: #{most_starred_repo['description']}"
puts "Stars: #{most_starred_repo['stargazers_count']}"
puts "URL: #{most_starred_repo['html_url']}"
