class CreateTestScripts < ActiveRecord::Migration
  def change
    create_table :test_scripts do |t|
      t.string :test_case_id
      t.string :test_plan_id
      t.text :script_content

      t.timestamps
    end
  end
end
