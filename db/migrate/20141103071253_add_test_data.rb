class AddTestData < ActiveRecord::Migration
  def up
  	add_column :test_plan_data, :test_data,:text
  end

  def down
  end
end
