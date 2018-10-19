class AddLeadDaysToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :lead_days, :integer, default: 0
  end
end
