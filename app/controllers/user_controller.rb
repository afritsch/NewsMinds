require 'digest/sha1'

class UserController < ApplicationController
  before_filter :getUser, :only => [:changeMind, :edit, :updatePassword, :newPassword]

  
  # increases or decreases post score that is related to a user
  # note that this affects another user's mind
  def changeMind
    if !session[:id].nil?
      
      changeNumberOfVotedPosts( params[:post_estimation] )

      post = Post.where( :id => params[:post_id] ).first
      
      post.voted_usernames += @user.username + " "

      if params[:post_estimation] == params[:answer]
        post.score += 1
        post.user.mind += 1 if post.user.mind < 50
      else
        post.score -= 1
        post.user.mind -= 1 if post.user.mind > -50
      end
      
      post.user.save
      post.save
      
      redirect_to(top_stories_path, :notice => "Kommentar bewertet")
    
    else
      redirect_to(top_stories_path, :notice => "Du musst angemeldet sein, um Kommentare bewerten zu können")
    end

  end


  def logout
    session.delete(:id)
    
    redirect_to(root_path, :notice => "Erfolgreich Ausgeloggt")
  end


  def login 
   
    @user = User.where( :username => params[:username], :password => Digest::SHA1.hexdigest(params[:password]) ).first

      if !@user.nil?
        
        changeVotePower(@user)
        
        session[:id] = @user.id 
        
        redirect_to(root_path, :notice => "Erfolgreich eingeloggt")
      
      else
        redirect_to(root_path, :notice => "Falsche Eingabe")
      end

  end

  
  def registration
    @user = User.new
  end
 
 
  def create
    user = User.new(params[:user])
    
      if !doesUserExist?(user.username) && !doesFacebookEmailExist?(user.facebookEmail)
        
        if !user.valid?
          redirect_to(root_path, :notice => "Username oder Passwort nicht gültig, Username muss mindestens 4 lang sein und darf nicht mit einer Zahl beginnen. Das Passwort muss mindestens 6 Zeichen lang sein. Außerdem dürfen der Username und das Passwort keine Leerzeichen enthalten.")
          return
        end
        
        user.password = Digest::SHA1.hexdigest(user.password)
        user.numberOfPosCreatedPosts = 0 
        user.numberOfNegCreatedPosts = 0 
        user.numberOfPosVotedPosts = 0 
        user.numberOfNegVotedPosts = 0 
        user.mind = 0
        user.votePower = 1
        
        user.save
        redirect_to(root_path, :notice => "Erfolgreich registriert")

      else
        redirect_to(root_path, :notice => "Username oder Facebook Email Adresse schon vorhanden!") 
      end

  end

  
  def edit
  end

  def update
    
    user = User.where( :id => session[:id] ).first
    
    if !params[:user][:password].nil?
      
      user.password = params[:user][:password]
    
      if !user.valid? 
        redirect_to(profile_path, :notice => "Passwort nicht verifiziert.") 
        return
      else
        user.password = Digest::SHA1.hexdigest(user.password)
        user.update_attributes( params[:user][:password] ) 
      end

    end
  
    if !params[:user][:facebookEmail].nil?
    
      if doesFacebookEmailExist?( params[:user][:facebookEmail] )
        redirect_to(profile_path, :notice => "FacebookEmail schon vorhanden.") 
        return
      else
        user.update_attributes( :facebookEmail => params[:user][:facebookEmail] ) 
      end
      
    end
  
    redirect_to(profile_path, :notice => "Userdaten erfolgreich geändert.")
    
  end
  
  
  def facebookLogin
    
    fbHash = request.env['omniauth.auth']
    
    valid = User.where(:facebookEmail => fbHash['extra']['user_hash']['email']).first
    
    if !valid.nil?
      
      changeVotePower(valid)
      
      session[:id] = valid.id

      redirect_to(root_path, :notice => "Erfolgreich eingeloggt")
      
    else
      redirect_to(root_path, :notice => "Facebook Email Adresse nicht registriet")
    end
    
  end
  
  
  def newPassword
    if !(@user.password.eql? Digest::SHA1.hexdigest(params[:oldPassword]) )
      redirect_to(profile_path, :notice => "Falsches Passwort")
    end
    
    @user.password = ""
  end
  

  private

  def getUser
    @user = User.loggedInUser( session[:id] )
  end
  
  
  def doesUserExist?(username)
     
    for i in 0...User.count
      upperCaseUsername = User.all[i].username.upcase
      
      if username.upcase == upperCaseUsername
        return true
      end        
    end
    
    return false
  end
  
  
  def doesFacebookEmailExist?(facebookEmail)
    
    return false if facebookEmail.eql?""
    
    !(User.where(:facebookEmail => facebookEmail).first.nil?)
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
    when -50...-30 then user.votePower = 0
    when -30...20 then user.votePower = 1
    when 20...30 then user.votePower = 2
    when 30...50 then user.votePower = 3
    end

    user.save
  end

end
