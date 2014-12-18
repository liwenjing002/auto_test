class AddUserIdToTestScript < ActiveRecord::Migration
  def change
  	add_column :test_scripts, :user_id, :string
  end
end
