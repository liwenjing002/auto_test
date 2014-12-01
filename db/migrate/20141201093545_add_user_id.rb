class AddUserId < ActiveRecord::Migration
  def up
  		add_column :test_plans, :user_id,:string
  end

  def down
  end
end
