class Interface < ApplicationRecord
  belongs_to :enterprise
  has_many :behavior_hooks
      
end
