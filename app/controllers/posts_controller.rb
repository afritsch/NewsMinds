# Copyright (C) <2012> <Bruenner Franz Josef, Fritsch Andreas>

class PostsController < ApplicationController
  before_filter :getPost, :only => [:edit] 

  def index 
    @posts = User.where( :id => session[:id] ).first.posts
  end


  def new
    if session[:id]
      @post = Post.new

      @top_story = TopStory.find( params[:top_story_id] )

      @user_id = User.where( :id => session[:id] ).first.id

    else
      redirect_to(top_stories_path, :notice => "Du musst angemeldet sein, um einen Kommentar erstellen zu können")
    end
  end
 

  def create

    post = Post.new( params[:post] ) 

    post.top_story_id = params[:top_story_id]
    post.user_id = params[:user_id]
    post.score = 0
    post.voted_usernames = ""


    if params[:estimation] == "positiv" 
      post.estimation = 1

      post.user.numberOfPosCreatedPosts += 1
    else
      post.estimation = 0

      post.user.numberOfNegCreatedPosts += 1
    end

    valid = post.save
    
    if valid
      post.user.save

      redirect_to(top_stories_path, :notice => "Kommentar erfolgreich erstellt")
    else
      redirect_to(top_stories_path, :notice => "Kommentar nicht vollständig ausgefüllt")
    end

  end


  def edit
  end
  

  def update
    Post.find( params[:id] ).update_attributes( params[:post] ) 
    redirect_to(posts_path, :notice => "Kommentar erfolgreich geändert")
  end 
   
   
  private

  def getPost
    @post = Post.find( params[:id] )
  end
  

end
