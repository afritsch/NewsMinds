
class UserController < ApplicationController

  def logout
    session.delete(:username)
    
    respond_to do |format|
      format.html { redirect_to(root_path, :notice => "Ausgeloggt") }
      format.xml  { render :xml => {}, status => :ok }
    end

  end

  def checkUser
   
    @user = User.where( :username => params[:username], :password => params[:password] )

    respond_to do |format|

      if !@user.empty?
        session[:username] = params[:username] 

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
    @user = User.new(params[:user])
    
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
	  format.html  { redirect_to(root_path, :notice => "Username oder Passwort nicht gueltig") }
          format.json  { render :json => @user.errors, :status => :unprocessable_entity }
	end
      else
        format.html  { redirect_to(root_path, :notice => "Username schon vorhanden") }
        format.json  { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

end
