class AddMemo < ActiveRecord::Migration
  def up
  	add_column :test_plans, :memo,:text
  end

  def down
  end
end
