class PostsController < ApplicationController
  def index
    @posts = User.where( :username => session[:username] )[0].posts
 
    respond_to do |format|
      format.html
      format.xml { render :xml => @posts }
    end
  end

  def new
  end
 
  def edit
  end
  
  def create
  end

end
