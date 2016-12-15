module RecommendationsHelper

  def rome2rio(two_card_ids)
      card1 = Card.find(two_card_ids[0])
      card2 = Card.find(two_card_ids[1])
      url = "http://free.rome2rio.com/api/1.4/json/Search?key=#{ENV['ROME2RIO']}&oPos=#{card1.latitude},#{card1.longitude}&dPos=#{card2.latitude},#{card2.longitude}"
      file = open(url).read
      r2r_query = JSON.parse(file)
      @transport1 = {
        name: r2r_query["routes"][0]["name"],
        price: r2r_query["routes"][0]["indicativePrices"][0]["price"],
        url: "https://www.rome2rio.com/s/#{card1.latitude},#{card1.longitude}/#{card2.latitude},#{card2.longitude}"
      } unless r2r_query["routes"][0].nil? || r2r_query["routes"][0]["indicativePrices"].nil?
      @transport2 = {
        name: r2r_query["routes"][1]["name"],
        price: r2r_query["routes"][1]["indicativePrices"][0]["price"],
        url: "https://www.rome2rio.com/s/#{card1.latitude},#{card1.longitude}/#{card2.latitude},#{card2.longitude}"
      } unless r2r_query["routes"][1].nil? || r2r_query["routes"][1]["indicativePrices"].nil?
      @transport3 = {
        name: r2r_query["routes"][2]["name"],
        price: r2r_query["routes"][2]["indicativePrices"][0]["price"],
        url: "https://www.rome2rio.com/s/#{card1.latitude},#{card1.longitude}/#{card2.latitude},#{card2.longitude}"
      } unless r2r_query["routes"][2].nil? || r2r_query["routes"][2]["indicativePrices"].nil?
  end

  def which_icon(transport_name)
    transport_name.downcase!
    if transport_name.include? "car"
      return "car.png"
    elsif transport_name.include? "drive"
      return "car.png"
    elsif transport_name.include? "bus"
      return "bus.png"
    elsif transport_name.include? "taxi"
      return "car.png"
    elsif transport_name.include? "fly"
      return "plane.png"
    elsif transport_name.include? "train"
      return "train.png"
    elsif transport_name.include? "subway"
      return "train.png"
    elsif transport_name.include? "metro"
      return "train.png"
    else
      return "bus.png"
    end
  end

end
