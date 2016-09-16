require 'pry'
require 'httparty'
module Services
  class SeatGeekClient

    BASE_URL = "api.seatgeek.com"
    def search(city, date)
      city = city.downcase.split(" ").join("%20")
      date = date.split("-")
      date = [date[0].to_i, date[1].to_i, date[2].to_i+1].join("-")
      @client_id = "NTU5ODg3MHwxNDczMDA2NTcz"
      HTTParty.get("https://api.seatgeek.com/2/events?venue.city=#{city}&datetime_utc=#{date}&per_page=5")
    end
  end

  class EventAdapter
    def get_events(city)
      date = (Time.new).strftime("%Y-%m-%d")
      response = SeatGeekClient.new.search(city, date)
      if response["meta"]["total"].to_i > 0
        listings = response["events"].collect do |event|
          {title: event["title"],
          url: event["url"],
          venue: event["venue"]["name"],
          location: event["venue"]["location"],
          type: event["performers"][0]["taxonomies"][0]["name"]}
        end
        puts listings
      else
        puts "Sorry! Looks like nothing is going on in your city tomorrow!"
      end
    end
  end
end
