class CreateFlowDateTypes < ActiveRecord::Migration
  def change
    create_table :flow_date_types do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
