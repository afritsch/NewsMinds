module ApplicationHelper
  
  def isUserLoggedIn
    if session[:username] != nil
      return true
    else
      return false
    end
  end

end
