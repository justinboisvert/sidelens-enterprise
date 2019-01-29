class EnterpriseController < ActionController::Base
  skip_before_action :verify_authenticity_token  
  def login()
    render :json => Enterprise.login(params[:username], params[:password]) 
  end

  def get_by_session()
    if !request.headers["Auth"].blank?
      render :json => Enterprise.get_by_session(request.headers["Auth"])
    else
      render :json => {:message => "Authentication not provided."}
    end
  end

  def logout()
    if !request.headers["Auth"].blank?
      $redis.del(request.headers["Auth"])
      render :json => {:message => "Logged out successfully."}
    else
      render :json => {:message => "Authentication not provided."}
    end
  end
 
  def create_interface()
    if !request.headers["Auth"].blank?
      enterprise = Enterprise.get_by_session(request.headers["Auth"])
      interface = enterprise.interfaces.create(:connected => false, :host => params[:host], :port => params[:port], :description => params[:description])
      return :json => interface 
    else
      render :json => {:message => "Authentication not provided."}
    end
  end
 
end
