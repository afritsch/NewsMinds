class UserController < ApplicationController

  def changeMind
    if session[:username] != nil
      @user = User.where( :username => session[:username] ).first

      if params[:post_estimation] == params[:answer]
        @user.mind += 1
        @user.numberOfPosPosts += 1
      else
        @user.mind -= 1
        @user.numberOfNegPosts += 1
      end
 
      @user.save

      redirect_to(top_stories_path, :notice => "Kommentar bewertet")
    else
      redirect_to(top_stories_path, :notice => "Du musst angemeldet sein, um Kommentare bewerten zu koennen")
    end
  end


  def logout
    session.delete(:username)
    
    respond_to do |format|
      format.html { redirect_to(root_path, :notice => "Ausgeloggt") }
      format.xml  { render :xml => {}, status => :ok }
    end

  end


  def checkUser
   
    @user = User.where( :username => params[:username].upcase, :password => params[:password] )

    respond_to do |format|

      if !@user.empty?
        session[:username] = params[:username].upcase 

        format.html { redirect_to(root_path, :notice => "Du bist eingeloggt") }
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

        @user.numberOfPosPosts = 0 

        @user.numberOfNegPosts = 0 
        
        @user.mind = 50
 
        @valid = @user.save
        
	if @valid
          format.html  { redirect_to(root_path, :notice => "User erfolgreich erzeugt") }
          format.json  { render :json => @user, :status => :created, :location => root_path }
        else
	  format.html  { redirect_to(root_path, :notice => "Username oder Passwort nicht gueltig, Username muss mindestens 4 aber maximal 12 Zeichen beinhalten und Passwort muss mindestens 6 aber maximal 15 Zeichen beinhalten.") }
          format.json  { render :json => @user.errors, :status => :unprocessable_entity }
	end
      else
        format.html  { redirect_to(root_path, :notice => "Username schon vorhanden") }
        format.json  { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

end
