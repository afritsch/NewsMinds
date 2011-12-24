module ApplicationHelper
  
  def isUserLoggedIn
    !session[:id].nil?
  end
  
  def hasGotTopStory?
    Time.now.to_s.slice(8..9).eql? TopStory.last.pubDate.slice(8..9)
  end

end
