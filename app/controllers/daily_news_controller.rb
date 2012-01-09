﻿# Copyright (C) <2012> <Bruenner Franz Josef, Fritsch Andreas>

class DailyNewsController < ApplicationController
    
  def chooseTheme
    @daily_news = DailyNews.onlyThemes
  end
 

  def voteForTheme
   
    if cookies[:voted] != nil 
      redirect_to(choose_theme_path, :notice => "Du hast schon abgestimmt")
    else
     
      if !session[:id].nil?
 
        cookies[:voted] = { :value => "voted", :expires => 20.hours.from_now } 
        
        @voted_news = DailyNews.where( :id => params[:id] )
        @voted_news[0].clicks += User.loggedInUser( session[:id] ).votePower
        @voted_news[0].save

      else
        redirect_to(choose_theme_path, :notice => "Du musst dich registrieren, um abstimmen zu können")

      end

    end 

  end
end
