class SearchesController < ApplicationController

  def search
  end

  def friends
    foursquare = FoursquareService.new
     @friends = foursquare.friends(session[:token])
  end

  def coffee_shops
     foursquare = FoursquareService.new
     @coffee_shops = foursquare.coffee_shops(ENV['FOURSQUARE_CLIENT_ID'], ENV['FOURSQUARE_SECRET'])
   end


end
