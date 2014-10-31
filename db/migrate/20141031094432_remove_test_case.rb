class RemoveTestCase < ActiveRecord::Migration
  def up
  	remove_column :test_cases, :host
  	remove_column :test_cases, :user_name
  	remove_column :test_cases, :pd
  end

  def down
  end
end
