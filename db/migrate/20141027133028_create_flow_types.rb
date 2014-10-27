class CreateFlowTypes < ActiveRecord::Migration
  def change
    create_table :flow_types do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
