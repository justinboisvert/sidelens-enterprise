require 'json'

class AdminController < ActionController::Base
  skip_before_action :verify_authenticity_token  
  @@main_url = "<a href = '/panel'><img src ='/img/logo.png' width='107.44' height='30.77'/></a><span id='menu_links'><a href = '/panel/interfaces'>interfaces</a> <a href = '/panel/behaviors'>behaviors</a> <a href='/panel/settings'>settings</a> <a href='javascript:logout()'>logout</a></span>"

  helper_method :get_menu
    
  def index
    render
  end

  def get_menu
    return @@main_url
  end

  def interfaces
    render
  end

  def settings
    render
  end

  def interfaces_selection
    render
  end

  def behaviors
    render
  end

  def behaviors_selection
    render
  end

  def rules 
    render :json => ["endpoint","geo","ip","status"]
  end

  def logout
    render
  end
end
