Rails.application.routes.draw do
  # Routes for the Offer resource:
  # CREATE
  get "/offers/new", :controller => "offers", :action => "new"
  post "/create_offer", :controller => "offers", :action => "create"

  # READ
  get "/offers", :controller => "offers", :action => "index"
  get "/offers/:id", :controller => "offers", :action => "show"

  # UPDATE
  get "/offers/:id/edit", :controller => "offers", :action => "edit"
  post "/update_offer/:id", :controller => "offers", :action => "update"

  # DELETE
  get "/delete_offer/:id", :controller => "offers", :action => "destroy"
  #------------------------------

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
