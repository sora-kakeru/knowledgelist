Rails.application.routes.draw do
  # Routes for the Want resource:
  # CREATE
  get "/wants/new", :controller => "wants", :action => "new"
  post "/create_want", :controller => "wants", :action => "create"

  # READ
  get "/wants", :controller => "wants", :action => "index"
  get "/wants/:id", :controller => "wants", :action => "show"

  # UPDATE
  get "/wants/:id/edit", :controller => "wants", :action => "edit"
  post "/update_want/:id", :controller => "wants", :action => "update"

  # DELETE
  get "/delete_want/:id", :controller => "wants", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
