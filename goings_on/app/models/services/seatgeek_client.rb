require 'pry'
require 'HTTParty'

module Services
  class SeatGeekClient

    BASE_URL = "api.seatgeek.com"
    def search(city, date)
      city = city.downcase.split(" ").join("%20")
      @client_id = "NTU5ODg3MHwxNDczMDA2NTcz"
      HTTParty.get("https://api.seatgeek.com/2/events?venue.city=#{city}&datetime_utc=#{date}&per_page=5")
      binding.pry
    end
  end

end










##implement binary search or merge sort to order by relevance rating?
