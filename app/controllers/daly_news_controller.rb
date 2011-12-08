class DalyNewsController < ApplicationController
    
  def chooseTheme
    
    @daly_news = DalyNews.onlyThemes

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @top_stories }
    end
  end
  
  def voteForTheme
   
    if cookies[:voted] != nil 

      respond_to do |format|
        format.html { redirect_to(root_path, :notice => "Du hast schon abgestimmt") }
        format.xml { render :xml => @voted_news }
      end

    else
     
      if session[:username] != nil
 
        cookies[:voted] = { :value => "voted", :expires => 20.hours.from_now } 

        @voted_news = DalyNews.where( :id => params[:id] )
        @voted_news[0].clicks += 1
        @voted_news[0].save

        respond_to do |format|
          format.html
          format.xml  { render :xml => @voted_news }
        end

      else
        redirect_to(root_path, :notice => "Du musst dich registrieren, um abstimmen zu können")

      end

    end 

  end
end
