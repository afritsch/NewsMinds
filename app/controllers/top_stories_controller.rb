class TopStoriesController < ApplicationController

  def discussion
    
    @latest_top_story = TopStory.last

    # post score is going to be put into users mind score 
    # that has got that post
    
    if session[:username] != nil 
      @user = User.where( :username => session[:username] ).first
      
      @sum = 0
      @user.posts.each do |post|
        @sum += post.score
      end
      
      if @sum != @user.mind 
        @user.mind = @sum
	@user.save
      end
    end
      
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @latest_top_story }
    end
  end
  

  def selectPrevDays
    
    @top_stories = TopStory.where( :id => params[:id] ).first
    
    respond_to do |format|
      format.html
      format.xml  { render :xml => @top_stories }
    end
  end 

end
