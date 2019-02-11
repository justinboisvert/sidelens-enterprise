class Behavior < ApplicationRecord
  belongs_to :interface, :optional => true
  belongs_to :enterprise
end
