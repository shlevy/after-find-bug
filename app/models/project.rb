class Project < ActiveRecord::Base
  has_many :milestones
  has_many :time_logs
  attr_accessible :name
end
