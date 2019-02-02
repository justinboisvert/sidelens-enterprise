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
  post "/enterprise/login", to: "enterprise#login"
  get "/enterprise/self", to: "enterprise#get_by_session"
  post "/enterprise/logout", to: "enterprise#logout"
  get "/panel/", to: "admin#index"
  get "/panel/interfaces", to: "admin#interfaces"
end
