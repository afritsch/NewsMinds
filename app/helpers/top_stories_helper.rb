module TopStoriesHelper
  def hasUserAlreadyVoted(usernames, logged_in_user)
    username_array = usernames.split(" ")

    username_array.each do |username|
      if username == logged_in_user
        return true
      end
    end

    return false

  end
  

  def doesPostBelongToUser(logged_in_username, post_of_user)
    if logged_in_username != post_of_user
      return false
    else
      return true
    end
  end

end
