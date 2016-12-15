module RecommendationsHelper

  def rome2rio(two_points)
    two_points.each_cons(2) do |x, y|
      card1 = Card.find(x)
      card2 = Card.find(y)
      url = "http://free.rome2rio.com/api/1.4/json/Search?key=#{ENV['ROME2RIO']}&oPos=#{card1.latitude},#{card1.longitude}&dPos=#{card2.latitude},#{card2.longitude}"
      file = open(url).read
      r2r_query = JSON.parse(file)
      @transport1 = {
        name: r2r_query["routes"][0]["name"],
        price: r2r_query["routes"][0]["indicativePrices"][0]["price"],
        url: "https://www.rome2rio.com/s/#{card1.latitude},#{card1.longitude}/#{card2.latitude},#{card2.longitude}"
      }
      @transport2 = {
        name: r2r_query["routes"][1]["name"],
        price: r2r_query["routes"][1]["indicativePrices"][0]["price"],
        url: "https://www.rome2rio.com/s/#{card1.latitude},#{card1.longitude}/#{card2.latitude},#{card2.longitude}"
      } unless r2r_query["routes"][1].nil?
      @transport3 = {
        name: r2r_query["routes"][2]["name"],
        price: r2r_query["routes"][2]["indicativePrices"][0]["price"],
        url: "https://www.rome2rio.com/s/#{card1.latitude},#{card1.longitude}/#{card2.latitude},#{card2.longitude}"
      } unless r2r_query["routes"][2].nil?
    end


  end

end
