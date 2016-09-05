require 'httparty'
require 'pry'

client_id = "NTU5ODg3MHwxNDczMDA2NTcz"
secret = "qMhGKkDUXc22H-c_VdATloVcT0UsEBg-AsUAOmza"

date = (Time.new).strftime("%Y-%m-%d")
print "What is your city? "
city = gets.chomp.downcase.split(" ").join("%20")
uri = "https://api.seatgeek.com/2/events?venue.city=#{city}&datetime_utc=#{date}&per_page=50"
response = HTTParty.get("#{uri}")


listings = response["events"].collect do |event|
  {title: event["title"],
  url: event["url"],
  venue: event["venue"]["name"],
  location: event["venue"]["location"],
  type: event["performers"][0]["taxonomies"][0]["name"]}
end


##implement binary search or merge sort to order by relevance rating?
