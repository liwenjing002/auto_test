class AddTestNum < ActiveRecord::Migration
  def up
  	add_column :test_plans, :test_num,:string
  end

  def down
  end
end
