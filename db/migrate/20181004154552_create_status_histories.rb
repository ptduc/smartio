class CreateStatusHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :status_histories do |t|
      t.references :device, foreign_key: true
      t.boolean :relay1_mode
      t.boolean :relay1_status
      t.boolean :relay2_mode
      t.boolean :relay2_status
      t.boolean :relay3_mode
      t.boolean :relay3_status
      t.boolean :relay4_mode
      t.boolean :relay4_status

      t.timestamps
    end
  end
end
