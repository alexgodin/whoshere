class VenuesController < ApplicationController
  OAUTH_ID = 'QEKS511IQE0N2TELGEY2D2J1HUWBOVX3ONZS1NTAIDT2FTHW' 
  def search
    latlng=Geokit::Geocoders::YahooGeocoder.geocode(params[:near]).ll
    @venue = s(params[:place], latlng).parsed_response["response"]["groups"].first["items"].first["id"]
    logger.info "venues is #{@venue.inspect}"
    @herenow = l.parsed_response["response"]["hereNow"]["items"]
    logger.info "here now is #{@herenow.first["user"]["firstName"]}"
    @place = Place.new
    @place.create_inc(@venue)
  end
  
  def main
    @title = "whoshe.re - search"
  end
  
  def disp
    @title = "whoshe.re - listed"
  end
  
  private
  
  def s(thing, near)
    url = "https://api.foursquare.com/v2/venues/search?ll=#{near}&query=#{URI::encode(thing)}&oauth_token=#{OAUTH_ID}"
    logger.info "url1 -  #{url}"
    return HTTParty.get(url)
  end
  
  def l
    url = "https://api.foursquare.com/v2/venues/#{@venue}/herenow?oauth_token=#{OAUTH_ID}"
    logger.info "url2 is #{url}"
    return HTTParty.get(url)
  end
  
end
