class SearchesController < ApplicationController
  def search
  end

  def friends
    foursquare = FoursquareService.new
    @friends = foursquare.friends(session[:token])
  end

  def coffee_shops
    render 'search'
  end

  def foursquare
    foursquare = FoursquareService.new
    @venues = foursquare.coffee_shops(ENV['FOURSQUARE_CLIENT_ID'], ENV['FOURSQUARE_SECRET'], params[:zipcode], "coffee shops")
    render 'search'
  end
end