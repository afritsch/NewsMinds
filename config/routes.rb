# Copyright (C) <2012> <Bruenner Franz Josef, Fritsch Andreas>

Qpt2a::Application.routes.draw do
  
  root :to => "Home#index"
  
  get "home/index"
  
  resources :home

  
  get "user/register"

  resources :user
    match 'User/logout' => "User#logout", :as => "logout"
    match 'User/register' => "User#registration", :as => "register"
    match 'User/login' => "User#login", :as => "login"
    match 'User/create' => "User#create", :as => "create"
    match 'User/changeMind/:answer/:post_estimation/:post_id' => "User#changeMind", :as => "user_mind", :via => :post
    match 'User/profile' => "User#edit", :as => "profile"
    match 'User/newPassword' => "User#newPassword"
    match "auth/:facebook/callback" => "User#facebookLogin"
  

  get "daily_news/chooseTheme"
  get "daily_news/voteForTheme" 

  resources :daily_news
    match 'chooseTheme' => "DailyNews#chooseTheme", :as => "choose_theme"
    match 'daily_news/:id' => "DailyNews#voteForTheme", :via => :post
 
 
  get "top_stories/discussion"
  get "top_stories/selectPrevDays"

  resources :top_stories
    match 'themeOfDay' => "TopStories#discussion", :as => "top_stories"  
    match 'prevDays/:id' => "TopStories#selectPrevDays", :as => "prev_days"     
    match 'archive' => "TopStories#archive", :as => "archive" 
  
  get "posts/index"
  get "posts/new"
  get "posts/edit"

  resources :posts
    match "posts/:top_story_id/new" => "Posts#new", :as => "new_post"
    match "posts/:id/edit" => "Posts#edit", :as => "edit_post"
    match "myposts" => "Posts#userPosts", :as => "myposts"

end
