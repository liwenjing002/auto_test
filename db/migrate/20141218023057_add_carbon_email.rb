class AddCarbonEmail < ActiveRecord::Migration
  def up
  	 add_column :test_plans, :carbon_email, :string
  end

  def down
  end
end
