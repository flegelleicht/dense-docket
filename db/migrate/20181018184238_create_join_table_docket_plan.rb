class CreateJoinTableDocketPlan < ActiveRecord::Migration[5.2]
  def change
    create_join_table :dockets, :plans do |t|
      # t.index [:docket_id, :plan_id]
      # t.index [:plan_id, :docket_id]
    end
  end
end
