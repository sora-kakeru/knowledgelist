Rails.application.routes.draw do
  # Routes for the Counselor_like resource:
  # CREATE
  get "/counselor_likes/new", :controller => "counselor_likes", :action => "new"
  post "/create_counselor_like", :controller => "counselor_likes", :action => "create"

  # READ
  get "/counselor_likes", :controller => "counselor_likes", :action => "index"
  get "/counselor_likes/:id", :controller => "counselor_likes", :action => "show"

  # UPDATE
  get "/counselor_likes/:id/edit", :controller => "counselor_likes", :action => "edit"
  post "/update_counselor_like/:id", :controller => "counselor_likes", :action => "update"

  # DELETE
  get "/delete_counselor_like/:id", :controller => "counselor_likes", :action => "destroy"
  #------------------------------

  # Routes for the Session resource:
  # CREATE
  get "/sessions/new", :controller => "sessions", :action => "new"
  post "/create_session", :controller => "sessions", :action => "create"

  # READ
  get "/sessions", :controller => "sessions", :action => "index"
  get "/sessions/:id", :controller => "sessions", :action => "show"

  # UPDATE
  get "/sessions/:id/edit", :controller => "sessions", :action => "edit"
  post "/update_session/:id", :controller => "sessions", :action => "update"

  # DELETE
  get "/delete_session/:id", :controller => "sessions", :action => "destroy"
  #------------------------------

  # Routes for the Tag resource:
  # CREATE
  get "/tags/new", :controller => "tags", :action => "new"
  post "/create_tag", :controller => "tags", :action => "create"

  # READ
  get "/tags", :controller => "tags", :action => "index"
  get "/tags/:id", :controller => "tags", :action => "show"

  # UPDATE
  get "/tags/:id/edit", :controller => "tags", :action => "edit"
  post "/update_tag/:id", :controller => "tags", :action => "update"

  # DELETE
  get "/delete_tag/:id", :controller => "tags", :action => "destroy"
  #------------------------------

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
