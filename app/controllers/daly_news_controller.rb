class DalyNewsController < ApplicationController
    
  def chooseTheme
    @daly_news = DalyNews.onlyThemes
  end
 

  def voteForTheme
   
    if cookies[:voted] != nil 
      redirect_to(root_path, :notice => "Du hast schon abgestimmt")
    else
     
      if session[:username]
 
        cookies[:voted] = { :value => "voted", :expires => 20.hours.from_now } 
        
        @voted_news = DalyNews.where( :id => params[:id] )
        @voted_news[0].clicks += User.loggedInUser( session[:username] ).votePower
        @voted_news[0].save

      else
        redirect_to(root_path, :notice => "Du musst dich registrieren, um abstimmen zu können")

      end

    end 

  end
end
