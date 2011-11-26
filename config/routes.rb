Qpt2a::Application.routes.draw do
  
  resources :home


  get "user/register"

  resources :user
    match 'User/logout' => "User#logout", :as => "logout"
    match 'User/register' => "User#registration", :as => "register"
    match 'User/login' => "User#login", :as => "login"
    match 'User/create' => "User#create", :as => "create"
    match 'User/changeMind/:answer/:post_estimation/:post_id' => "User#changeMind", :as => "user_mind"  


  get "daly_news/chooseTheme"
  get "daly_news/voteForTheme" 

  resources :daly_news
    match 'chooseTheme' => "DalyNews#chooseTheme", :as => "choose_theme"
    match 'votedTheme/:id' => "DalyNews#voteForTheme"
 
 
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
    match "posts" => "Posts#index", :as => "posts"
    match "posts/destroy/all" => "Posts#destroy_all", :as => "destroy_all" 
    match "posts/destroy/:id" => "Posts#destroy", :as => "destroy"


  get "home/index"
  root :to => "Home#index"
  
end
