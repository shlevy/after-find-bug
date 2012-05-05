class CreateTimeLogs < ActiveRecord::Migration
  def change
    create_table :time_logs do |t|
      t.belongs_to :project
      t.belongs_to :invoice
      t.string :billing_invoice

      t.timestamps
    end
    add_index :time_logs, :project_id
    add_index :time_logs, :invoice_id
  end
end
