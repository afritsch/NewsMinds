# Copyright (C) <2012> <Bruenner Franz Josef, Fritsch Andreas>

module TopStoriesHelper
  def hasUserAlreadyVoted(usernames, logged_in_user_id)
    
    username_array = usernames.split(" ")
    current_logged_in_user = User.loggedInUser( logged_in_user_id )
    
    username_array.each do |username|
      if current_logged_in_user.username == username
        return true
      end
    end

    return false

  end
  

  def doesPostBelongToUser(logged_in_user_id, post_of_user)
    if User.loggedInUser( logged_in_user_id ).username != post_of_user
      return false
    else
      return true
    end
  end
  
end
