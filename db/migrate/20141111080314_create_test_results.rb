class CreateTestResults < ActiveRecord::Migration
  def change
    create_table :test_results do |t|
      t.string :test_plan_id
      t.string :test_case_id
      t.string :test_script_id
      t.text :test_result_content
      t.boolean :test_result_flag
      t.timestamps
    end
  end
end
