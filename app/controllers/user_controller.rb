require 'cgi'
require 'cgi/session'

class UserController < ApplicationController

  def login
  end

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
    
    @doesNotExist = User.where(:username => @user.username, :password => @user.password)
    
    respond_to do |format|

      if @doesNotExist.empty? 

        @user.numberOfPosPosts = 0 

        @user.numberOfNegPosts = 0 
        
        @user.mind = 50
 
        @user.save
        
        format.html  { redirect_to(root_path,
                      :notice => "User erfolgreich erzeugt") }
        format.json  { render :json => @user,
                      :status => :created, :location => root_path }
      else
        format.html  { redirect_to(root_path,
                      :notice => "Username oder Passwort schon vorhanden") }
        format.json  { render :json => @user.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

end