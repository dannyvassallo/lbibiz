class WelcomeController < ApplicationController
  def index
    @api_key = ""
    @client = GooglePlaces::Client.new(@api_key)
    @query_results = @client.spots_by_query('Pizza in long beach island new jersey')
    @results = @query_results.map do |result|
      # if result.type
      #   meal_delivery
      # end

      if result["photos"][0] != nil
        photo = result["photos"][0].photo_reference
        photo_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{photo}&key=#{@api_key}"
        photo = photo_url
      else
        photo = nil
      end

      {
        "name" => result["name"],
        "address" => result["formatted_address"],
        "photos" => photo,
        "phone_number" => result["formatted_phone_number"],
        "coords" => {:lat => result["lat"], :lng => result["lng"]}
      }
    end


  end
end
