class CreateTestCases < ActiveRecord::Migration
  def change
    create_table :test_cases do |t|
      t.string :title
      t.text :desc
      t.string :user_id

      t.timestamps
    end
  end
end
