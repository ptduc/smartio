class CreateStatusHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :status_histories do |t|
      t.references :device, foreign_key: true
      t.integer :relay1_mode, limit: 2
      t.boolean :relay1_status
      t.integer :time1_on, limit: 2
      t.integer :time1_off, limit: 2
      t.integer :times1
      t.string :times1_0
      t.string :times1_1
      t.string :times1_2
      t.string :times1_3
      t.string :times1_4
      t.integer :on1_0, limit: 2
      t.integer :on1_1, limit: 2
      t.integer :on1_2, limit: 2
      t.integer :on1_3, limit: 2
      t.integer :on1_4, limit: 2

      t.integer :relay2_mode, limit: 2
      t.boolean :relay2_status
      t.integer :time2_on, limit: 2
      t.integer :time2_off, limit: 2
      t.integer :times2
      t.string :times2_0
      t.string :times2_1
      t.string :times2_2
      t.string :times2_3
      t.string :times2_4
      t.integer :on2_0, limit: 2
      t.integer :on2_1, limit: 2
      t.integer :on2_2, limit: 2
      t.integer :on2_3, limit: 2
      t.integer :on2_4, limit: 2

      t.integer :relay3_mode, limit: 2
      t.boolean :relay3_status
      t.integer :time3_on, limit: 2
      t.integer :time3_off, limit: 2
      t.integer :times3
      t.string :times3_0
      t.string :times3_1
      t.string :times3_2
      t.string :times3_3
      t.string :times3_4
      t.integer :on3_0, limit: 2
      t.integer :on3_1, limit: 2
      t.integer :on3_2, limit: 2
      t.integer :on3_3, limit: 2
      t.integer :on3_4, limit: 2

      t.integer :relay4_mode, limit: 2
      t.boolean :relay4_status
      t.integer :time4_on, limit: 2
      t.integer :time4_off, limit: 2
      t.integer :times4
      t.string :times4_0
      t.string :times4_1
      t.string :times4_2
      t.string :times4_3
      t.string :times4_4
      t.integer :on4_0, limit: 2
      t.integer :on4_1, limit: 2
      t.integer :on4_2, limit: 2
      t.integer :on4_3, limit: 2
      t.integer :on4_4, limit: 2

      t.datetime :created_at
    end
  end
end
