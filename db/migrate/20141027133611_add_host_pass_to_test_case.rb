class AddHostPassToTestCase < ActiveRecord::Migration
  def change
  	add_column :test_cases, :host, :string
  	add_column :test_cases, :user_name, :string
  	add_column :test_cases, :password, :string
  end
end
