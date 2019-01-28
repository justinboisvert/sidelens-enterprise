require 'unirest'
require 'json'
require 'bcrypt'
#
# Mailchimp list id: afccdcf857 
#

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token  
  @@main_url = "<a href = '/'><img src ='img/logo.png' width='107.44' height='30.77'/></a><span id='menu_links'><a href = '/login'>login</a> <a href='/product'>product</a> <a href='/pricing'>pricing</a></span>"

  helper_method :get_menu

  def index()
    render 
  end

  def login()
    render
  end

  def product()
    render
  end

  def pricing()
    render
  end 

  def get_menu()
    return @@main_url
  end

  def create_enterprise()
    encrypted_pass = BCrypt::Password.create(params[:password])  
    enterprise = Enterprise.create(:username => params[:username], :password => encrypted_pass, :hasPaid => false)
    render :json => enterprise
  end
 
 
  def add_mailchimp()
    name = params[:name]
    company = params[:company]
    email = params[:email]
    reasoning = params[:reasoning]
    main_body = {"email_address" => params[:email], "status" => "subscribed",  "merge_fields" => {"NAME" => params[:name], "COMPANY" => params[:company], "REASONING" => params[:reasoning]}}.to_json
    res = Unirest.post("https://us20.api.mailchimp.com/3.0/lists/afccdcf857/members", parameters: main_body, :headers => {"Content-Type" => "application/json", "Authorization" => "Basic bdf3478ed5cbb19bc7b80b9f3d4545ba-us20"})
    render plain: res.body
  end
end
