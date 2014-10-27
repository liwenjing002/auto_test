class ModifyTestCase < ActiveRecord::Migration
  def up
  	rename_column :test_cases, :password, :pd
  end

  def down
  end
end
