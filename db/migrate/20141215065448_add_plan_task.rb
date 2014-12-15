class AddPlanTask < ActiveRecord::Migration
  def up
  	add_column :test_plans, :time_after,:string
  	add_column :test_plans, :time_every ,:string
  	add_column :test_plans, :time_at ,:string
  	add_column :test_plans, :time_cron ,:string
  	add_column :test_plans, :job_id,:string
  	add_column :test_plans, :job_status ,:string
  end

  def down
  end
end
