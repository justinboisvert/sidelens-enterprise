class BehaviorHook < ApplicationRecord
  belongs_to :interface
  serialize :ratelimit, JSON
end
