class DalyNewsController < ApplicationController
    
  def chooseTheme
    
    handler = NewsHandler.new
 
    #load DalyNews if nesseccary 
    handler.checkDalyNewsList
 
    @daly_news = DalyNews.all

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
 
        cookies[:voted] = { :value => "voted", :expires => 24.hours.from_now } 

        @voted_news = DalyNews.where( :id => params[:id] )
        @voted_news[0].clicks += 1
        @voted_news[0].save
     
        handler = DalyNewsHandler.new

        # if new news is selected to be top story, insert it into top_news database    
        handler.checkAndInsertNewsIntoTopStoryDatabase

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
