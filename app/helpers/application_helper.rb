module ApplicationHelper
  
  def isUserLoggedIn
    if session[:username] != nil
      return true
    else
      return false
    end
  end
  
  def hasGotTopStory?
    Time.now.to_s.slice(8..9).eql? TopStory.last.pubDate.slice(8..9)
  end

end
