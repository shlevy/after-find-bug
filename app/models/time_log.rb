class TimeLog < ActiveRecord::Base
  include InvoiceableModel
  after_find :set_invoice
  before_save :set_billing_invoice

  belongs_to :project
  belongs_to :invoice
  attr_accessible :billing_invoice
end
