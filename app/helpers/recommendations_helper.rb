module RecommendationsHelper

  def rome2rio(trip_array)
    trip_array.each_cons(2) do |x, y|
      card1 = Card.find(x)
      card2 = Card.find(y)
      url = "http://free.rome2rio.com/api/1.4/json/Search?key=#{ENV['ROME2RIO']}&oPos=#{card1.latitude},#{card1.longitude}&dPos=#{card2.latitude},#{card2.longitude}"
      file = open(url).read
      rome2rio_query = JSON.parse(file)
      raise
    end


  end

end
