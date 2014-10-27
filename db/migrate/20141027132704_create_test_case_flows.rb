class CreateTestCaseFlows < ActiveRecord::Migration
  def change
    create_table :test_case_flows do |t|
      t.string :test_case_id
      t.string :flow_type_id
      t.integer :flow_seq
      t.string :flow_location
      t.string :flow_date_type_id
      t.text :flow_date

      t.timestamps
    end
  end
end
