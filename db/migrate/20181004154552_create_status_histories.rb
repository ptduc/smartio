class CreateStatusHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :status_histories do |t|
      t.references :device, foreign_key: true
      t.integer :relay1_mode, limit: 1
      t.boolean :relay1_status, default: false
      t.integer :time1_on, limit: 2
      t.integer :time1_off, limit: 2
      t.string :times1
      t.integer :on1, limit: 2

      t.integer :relay2_mode, limit: 1
      t.boolean :relay2_status, default: false
      t.integer :time2_on, limit: 2
      t.integer :time2_off, limit: 2
      t.string :times2
      t.integer :on2, limit: 2

      t.integer :relay3_mode, limit: 1
      t.boolean :relay3_status, default: false
      t.integer :time3_on, limit: 2
      t.integer :time3_off, limit: 2
      t.string :times3
      t.integer :on3, limit: 2

      t.integer :relay4_mode, limit: 1
      t.boolean :relay4_status, default: false
      t.integer :time4_on, limit: 2
      t.integer :time4_off, limit: 2
      t.string :times4
      t.integer :on4, limit: 2

      t.datetime :created_at
    end
  end
end
