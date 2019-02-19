class Behavior < ApplicationRecord
  belongs_to :interface, :optional => true
  belongs_to :enterprise
  serialize :bscript, JSON
end
