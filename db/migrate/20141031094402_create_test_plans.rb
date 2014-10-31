class CreateTestPlans < ActiveRecord::Migration
  def change
    create_table :test_plans do |t|
      t.string :name
      t.string :host
      t.string :user_name
      t.string :pd
      t.string :log_path

      t.timestamps
    end
  end
end
