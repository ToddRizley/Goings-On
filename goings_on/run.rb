require 'pry'
require './seat_geek_client_adapter.rb'

puts "Please input your city"
city = gets.chomp
Services::EventAdapter.new.get_events("#{city}")
