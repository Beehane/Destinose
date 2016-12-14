module PagesHelper
  def find_liked_swipes(reco)
    @swipes_liked = 0
    reco.swipes.each do |s|
      @swipes_liked += 1 if s.liked == true
    end
    return @swipes_liked
  end
end
