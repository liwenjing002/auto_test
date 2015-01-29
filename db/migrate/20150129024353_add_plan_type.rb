class AddPlanType < ActiveRecord::Migration
  def up
  	add_column :test_plans, :plan_type_id, :integer
  end

  def down
  end
end
