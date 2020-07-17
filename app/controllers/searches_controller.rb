class SearchesController < ApplicationController

  def search
  end

  def friends
    foursquare = FoursquareService.new
    @friends = foursquare.friends(session[:token])
  end

  def foursquare
    foursquare = FoursquareService.new
    result = foursquare.search_coffee_shops(ENV['FOURSQUARE_CLIENT_ID'], ENV['FOURSQUARE_SECRET'], params[:zipcode])
    if result["meta"]["errorDetail"]
      @error = result["meta"]["errorDetail"]
    else
      @venues = result["response"]["venues"]
    end
    render 'search'
  end
end
