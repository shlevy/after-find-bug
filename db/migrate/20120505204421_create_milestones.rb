class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.belongs_to :project
      t.belongs_to :invoice
      t.string :billing_invoice

      t.timestamps
    end
    add_index :milestones, :project_id
    add_index :milestones, :invoice_id
  end
end
