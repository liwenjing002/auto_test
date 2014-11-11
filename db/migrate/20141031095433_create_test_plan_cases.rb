class CreateTestPlanCases < ActiveRecord::Migration
  def change
    create_table :test_plan_cases do |t|
      t.string :test_case_id
      t.string :test_plan_id
      t.timestamps
    end
  end
end
