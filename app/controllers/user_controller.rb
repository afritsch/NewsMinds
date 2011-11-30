class UserController < ApplicationController
  before_filter :getUser, :only => [:changeMind, :edit]

  def getUser
    @user = User.where( :username => session[:username] ).first
  end


  def changeNumberOfVotedPosts(answer)
    
    if answer.to_i == 1 
      @user.numberOfPosVotedPosts += 1
    else
      @user.numberOfNegVotedPosts += 1
    end
    
    @user.save

  end


  # increases or decreases post score that is related to a user mind
  # note that this affects another user's mind
  def changeMind
    if session[:username] != nil
      
      changeNumberOfVotedPosts( params[:post_estimation] )

      @post = Post.where( :id => params[:post_id] ).first
      
      @post.voted_usernames += session[:username] + " "

      if params[:post_estimation] == params[:answer]
	@post.score += 1
	@post.user.mind += 1 if @post.user.mind < 50
      else
	@post.score -= 1
	@post.user.mind -= 1 if @post.user.mind > -50
      end
      
      @post.user.save
      @post.save
      
      redirect_to(top_stories_path, :notice => "Kommentar bewertet")
    else
      redirect_to(top_stories_path, :notice => "Du musst angemeldet sein, um Kommentare bewerten zu können")
    end

  end


  def logout
    session.delete(:username)
    
    respond_to do |format|
      format.html { redirect_to(root_path, :notice => "Erfolgreich Ausgeloggt") }
      format.xml  { render :xml => {}, status => :ok }
    end

  end


  def login 
   
    @user = User.where( :username => params[:username].upcase, :password => params[:password] )

    respond_to do |format|

      if !@user.empty?
        session[:username] = params[:username].upcase 

        format.html { redirect_to(root_path, :notice => "Erfolgreich eingeloggt") }
        format.xml  { render :xml => {}, status => :ok }
      else
        format.html { redirect_to(root_path, :notice => "Falsche Eingabe") }
        format.xml  { render :xml => @user.errors, status => :unprocessable_entity }
      end
    end

  end

  
  def registration
    @user = User.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @user }
    end
  end
 
 
  def create
    @user = User.create(params[:user])
    
    @user.username = @user.username.upcase
    
    @doesNotExist = User.where(:username => @user.username)
    
    respond_to do |format|

      if @doesNotExist.empty? 

        @user.numberOfPosCreatedPosts = 0 
        @user.numberOfNegCreatedPosts = 0 
        @user.numberOfPosVotedPosts = 0 
        @user.numberOfNegVotedPosts = 0 
        @user.mind = 0
        @valid = @user.save
        
	if @valid
          format.html  { redirect_to(root_path, :notice => "Erfolgreich registriert") }
          format.json  { render :json => @user, :status => :created, :location => root_path }
        else
	  format.html  { redirect_to(root_path, :notice => "Username oder Passwort nicht gültig, Username muss zwischen 4 und 12 Zeichen lang sein und Passwort muss zwischen 6 und 15 Zeichen lang sein.") }
          format.json  { render :json => @user.errors, :status => :unprocessable_entity }
	end

      else
        redirect_to(root_path, :notice => "Username schon belegt") 
      end
    end

  end

  def edit
    respond_to do |format|
      format.html
      format.xml  { render :xml => @user }
    end
  end

  def update
    User.where( :username => session[:username] ).first.update_attributes( params[:user] )
    redirect_to(profile_path, :notice => "Userdaten erfolgreich geändert")
  end

end
