class AddDataType < ActiveRecord::Migration
  def up
  	add_column :test_plan_data, :flow_date_type_id,:string
  end

  def down
  end
end
