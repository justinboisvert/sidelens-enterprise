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
      interface = enterprise.interfaces.create(:name => params[:name], :connected => false, :host => params[:host], :port => params[:port], :description => params[:description], :behavior_list => "{}")
      render :json => interface 
    else
      render :json => {:message => "Authentication not provided."}
    end
  end
 
  def all_interfaces()
    if !request.headers["Auth"].blank?
      enterprise = Enterprise.get_by_session(request.headers["Auth"])
      render :json => enterprise.interfaces
    else
      render :json => {:message => "Authentication not provided."}
    end
  end

  def get_interface()
    if !request.headers["Auth"].blank?
      enterprise = Enterprise.get_by_session(request.headers["Auth"])
      interface = enterprise.interfaces.where(:id => params[:id].to_i).first
      render :json => interface
    else
      render :json => {:message => "authenticaiton not provided."}
    end
  end

  def create_behavior()
    if !request.headers["Auth"].blank?
      enterprise = Enterprise.get_by_session(request.headers["Auth"])
      behavior = enterprise.behaviors.create(:name => params[:name], :description => params[:description], :bscript => "")
      render :json => behavior
    else
      render :json => {:message => "authenticaiton not provided."}
    end
  end

  def all_behaviors()
    if !request.headers["Auth"].blank?
      enterprise = Enterprise.get_by_session(request.headers["Auth"])
      render :json => enterprise.behaviors
    else
      render :json => {:message => "authenticaiton not provided."}
    end  
  end


  def get_behavior()
    if !request.headers["Auth"].blank?
      enterprise = Enterprise.get_by_session(request.headers["Auth"])
      behavior = enterprise.behaviors.where(:id => params[:id]).first
      render :json => behavior
    else
      render :json => {:message => "authenticaiton not provided."}
    end 
  end

  def modify_behavior()
    if !request.headers["Auth"].blank?
      enterprise = Enterprise.get_by_session(request.headers["Auth"])
      behavior = enterprise.behaviors.where(:id => params[:id]).first
      behavior.update(:name => params[:name], :description => params[:description], :bscript => params[:bscript])
      render :json => behavior    
    else
      render :json => {:message => "authentication not provided."}
    end
  end

  def update_interface_behaviors()
    if !request.headers["Auth"].blank?
      enterprise = Enterprise.get_by_session(request.headers["Auth"])
      interface = enterprise.interfaces.where(:id => params[:id]).first
      interface.update(:behavior_list => params[:behavior_list])
      render :json => interface[:behavior_list]    
    else
      render :json => {:message => "authentication not provided."}
    end
  end

  def update_interface_behaviors()
    if !request.headers["Auth"].blank?
      enterprise = Enterprise.get_by_session(request.headers["Auth"])
      interface = enterprise.interfaces.where(:id => params[:id]).first
      interface.update(:behavior_list => params[:behavior_list])
      render :json => interface[:behavior_list]    
    else
      render :json => {:message => "authentication not provided."}
    end
  end

  def get_interface_behaviors()
    if !request.headers["Auth"].blank?
      enterprise = Enterprise.get_by_session(request.headers["Auth"])
      interface = enterprise.interfaces.where(:id => params[:id]).first
      render :plain => interface[:behavior_list]    
    else
      render :json => {:message => "authentication not provided."}
    end
  end

  def modify_interface()
   if !request.headers["Auth"].blank?
      enterprise = Enterprise.get_by_session(request.headers["Auth"])
      behavior = enterprise.interfaces.where(:id => params[:id]).first
      behavior.update(:name => params[:name], :description => params[:description], :host => params[:host], :port => params[:port])
      render :json => behavior    
    else
      render :json => {:message => "authentication not provided."}
    end
  end
end
