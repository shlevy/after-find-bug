class Invoice < ActiveRecord::Base
  has_many :milestones
  has_many :time_logs
  attr_accessible :number
end
