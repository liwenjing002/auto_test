class CreateTestPlanData < ActiveRecord::Migration
  def change
    create_table :test_plan_data do |t|
      t.string :test_plan_id
      t.string :test_case_flow_id

      t.timestamps
    end
  end
end
