require 'securerandom'

class Enterprise < ApplicationRecord
  has_many :interfaces

  def self.login(username,password)
    if exists?(:username => username)
      user = where(:username => username)[0]
      encrypted = BCrypt::Password.new(user.password)
      if encrypted == password
        sess = SecureRandom.hex(50)
        $redis.set(sess,user.id)
        $redis.expire(sess,3*24*60*60)
        return {:session => sess}
      else
        return {:message => "User/password combo does not exist"}
      end
    else
     return {:message => "User/password combo does not exist"}
    end    
  end

  def self.get_by_session(session)
    if $redis.get(session) != nil
      id = $redis.get(session).to_i
      return Enterprise.where(:id => id)
    else
      return {:message => "No session exists"}
    end
  end
 

   
end
