class TimeLog < ActiveRecord::Base
  belongs_to :project
  belongs_to :invoice
  attr_accessible :billing_invoice
end
