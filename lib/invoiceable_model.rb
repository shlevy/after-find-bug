module InvoiceableModel
  private
  def set_billing_invoice
    if self.invoice_id_changed?
      self.billing_invoice = self.invoice.nil? ? nil : self.invoice.number
    end
  end

  def set_invoice
    unless self.billing_invoice.nil? || self.billing_invoice == 
      if self.invoice.nil? || self.invoice.number != self.billing_invoice
        invoice = Invoice.find_by_number self.billing_invoice

        if invoice.nil?
          self.create_invoice number: self.billing_invoice
        else
          self.invoice = invoice
        end
      end
    end
  end
end
