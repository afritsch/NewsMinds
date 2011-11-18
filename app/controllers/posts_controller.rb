class PostsController < ApplicationController
  def index
    @posts = User.where( :username => session[:username] )[0].posts
 
    respond_to do |format|
      format.html
      format.xml { render :xml => @posts }
    end
  end

  def new
    @post = Post.new

    @top_story_id = params[:top_story_id]
    @user_id = User.where( :username => session[:username] ).first.id
 
    respond_to do |format|
      format.html
      format.xml { render :xml => @post }
    end 
  end
 
  def create

    @post = Post.create( params[:post] ) 
    @post.top_story_id = params[:top_story_id]
    @post.user_id = params[:user_id]
    @post.save

    respond_to do |format|
      format.html { redirect_to(top_stories_path, :notice => "Post erfolgreich erstellt") }
      format.xml { render :xml => @post }
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
    @post = Post.find( params[:id] )
    @post.update_attributes( params[:post] )
 
    redirect_to(root_path, :notice => "Kommentar geändert")
  end 

end
