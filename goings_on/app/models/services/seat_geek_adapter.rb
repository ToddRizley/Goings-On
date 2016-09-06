
# print "What is your city? "
# city = gets.chomp.downcase.split(" ").join("%20")

require 'pry'
class EventAdapter < Services
  def get_events(city)
    date = (Time.new).strftime("%Y-%m-%d")
    binding.pry
    response = SeatGeekClient.new.search(city, date)
    binding.pry
    listings = response["events"].collect do |event|
      {title: event["title"],
      url: event["url"],
      venue: event["venue"]["name"],
      location: event["venue"]["location"],
      type: event["performers"][0]["taxonomies"][0]["name"]}
      binding.pry
    end
  end
end


EventAdapter.new.get_events("New York")


  # Services::SeatGeekClient.new.search("Boston", "2016-09-09")
