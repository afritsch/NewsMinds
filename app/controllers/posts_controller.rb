class PostsController < ApplicationController
  before_filter :get_post, :only => [:edit, :update]

  def get_post
    @post = Post.find( params[:id] )
  end


  def userPosts 
    @posts = User.where( :username => session[:username] ).first.posts
 
    respond_to do |format|
      format.html
      format.xml { render :xml => @posts }
    end
  end


  def new
    if session[:username] != nil
      @post = Post.new

      @top_story = TopStory.find( params[:top_story_id] )

      @user_id = User.where( :username => session[:username] ).first.id
 
      respond_to do |format|
        format.html
        format.xml { render :xml => @post }
      end 
    else
      redirect_to(top_stories_path, :notice => "Du musst angemeldet sein, um einen Kommentar erstellen zu können")
    end
  end
 

  def create

    @post = Post.create( params[:post] ) 

    @post.top_story_id = params[:top_story_id]
    @post.user_id = params[:user_id]
    @post.score = 0
    @post.voted_usernames = ""


    if params[:estimation] == "positiv" 
      @post.estimation = 1

      @post.user.numberOfPosCreatedPosts += 1
    else
      @post.estimation = 0

      @post.user.numberOfNegCreatedPosts += 1
    end

    @valid = @post.save
    
    if @valid
      @post.user.save

      redirect_to(top_stories_path, :notice => "Kommentar erfolgreich erstellt")
    else
      redirect_to(top_stories_path, :notice => "Kommentar nicht vollständig ausgefüllt")
    end

  end


  def edit
    @post = Post.find( params[:id] )

    respond_to do |format|
      format.html      
      format.xml { render :xml => @post }
    end

  end
  

  def update
    Post.find( params[:id] ).update_attributes( params[:post] )
 
    redirect_to(myposts_path, :notice => "Kommentar erfolgreich geändert")
  end 
  

  def destroy
    User.where( :username => session[:username] ).first.posts.find( params[:id] ).destroy
    
    redirect_to(myposts_path, :notice => "Kommentar erfolgreich gelöscht")
  end

 
  def destroy_all
    User.where( :username => session[:username] ).first.posts.destroy_all
   
    redirect_to(myposts_path, :notice => "Alle Kommentare erfolgreich gelöscht")
  end

end
