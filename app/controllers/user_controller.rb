class UserController < ApplicationController
  before_filter :getUser, :only => [:changeMind, :edit]

  
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
    
    redirect_to(root_path, :notice => "Erfolgreich Ausgeloggt")
  end


  def login 
   
    @user = User.where( :username => params[:username].upcase, :password => params[:password] ).first

      if !@user.nil?
        
        changeVotePower(@user)
        
        session[:username] = params[:username].upcase 
        
        redirect_to(root_path, :notice => "Erfolgreich eingeloggt")
      
      else
        redirect_to(root_path, :notice => "Falsche Eingabe")
      end

  end

  
  def registration
    @user = User.new
  end
 
 
  def create
    @user = User.create(params[:user])
    
    @user.username = @user.username.upcase
    
    doesNotExist = User.where(:username => @user.username)

      if doesNotExist.empty? 

        @user.numberOfPosCreatedPosts = 0 
        @user.numberOfNegCreatedPosts = 0 
        @user.numberOfPosVotedPosts = 0 
        @user.numberOfNegVotedPosts = 0 
        @user.mind = 0
        @user.votePower = 1
        @valid = @user.save
        
        if @valid
          redirect_to(root_path, :notice => "Erfolgreich registriert")
        else
          redirect_to(root_path, :notice => "Username oder Passwort nicht gültig, Username muss zwischen 4 und 12 Zeichen lang sein und Passwort muss zwischen 6 und 15 Zeichen lang sein.")
        end

      else
        redirect_to(root_path, :notice => "Username schon belegt") 
      end

  end

  
  def edit
  end


  def update
    User.where( :username => session[:username] ).first.update_attributes( params[:user] )
    redirect_to(profile_path, :notice => "Userdaten erfolgreich geändert")
  end
  
  def facebookLogin
    
    fbHash = request.env['omniauth.auth']
    
    valid = User.where(:facebookEmail => fbHash['info']['email']).first
    
    if !valid.nil?
      
      changeVotePower(valid)
      
      session[:username] = params[:username].upcase 

      redirect_to(root_path, :notice => "Erfolgreich eingeloggt")
      
    else
      redirect_to(root_path, :notice => "Falsche Eingabe")
    end
    
  end
  

  private

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
  
  
  # if mind has changed this affects the votes the user is able to give
  def changeVotePower(user)
    case user.mind
    when -50...-30 then @user.votePower = 0
    when -30...20 then @user.votePower = 1
    when 20...30 then @user.votePower = 2
    when 30...50 then @user.votePower = 3
    end

    user.save
  end

end
