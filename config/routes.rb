Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "application#index"
  get "/login", to: "application#login"
  get "/pricing", to: "application#pricing"
  get "/product", to: "application#product"
  post "/add_mailchimp", to: "application#add_mailchimp"
  post "/enterprise/create", to: "application#create_enterprise"


  post "/enterprise/interfaces/create", to: "enterprise#create_interface"
  get "/enterprise/interfaces/", to: "enterprise#all_interfaces"
 # post "/enterprise/interfaces/:id/behaviors/attach/:id", to: "enterprise#attach_interface_behavior"
 # get "/enterprise/interfaces/:id/behaviors", to: "enterprise#get_interface_behaviors"
  get "/enterprise/interfaces/:id", to: "enterprise#get_interface"
  get "/enterprise/behaviors", to: "enterprise#all_behaviors"
  get "/enterprise/behaviors/:id", to: "enterprise#get_behavior"
  put "/enterprise/behaviors/:id", to: "enterprise#modify_behavior"
  post "/enterprise/behaviors/create", to: "enterprise#create_behavior"
  post "/enterprise/login", to: "enterprise#login"
  get "/enterprise/self", to: "enterprise#get_by_session"
  post "/enterprise/logout", to: "enterprise#logout"

 
  get "/panel/", to: "admin#index"
  get "/panel/interfaces", to: "admin#interfaces"
  get "/panel/interfaces/:id", to: "admin#interfaces_selection"
  get "/panel/behaviors", to: "admin#behaviors"
  get "/panel/behaviors/:id", to: "admin#behaviors_selection"
  get "/panel/tools/rules", to: "admin#rules"
end
