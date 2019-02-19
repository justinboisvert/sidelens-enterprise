class Interface < ApplicationRecord
  belongs_to :enterprise
  serialize :behavior_list, JSON  
end
