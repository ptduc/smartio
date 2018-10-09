class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :code
      t.references :unit, foreign_key: true
      t.boolean :is_active, default: true
      t.string  :ip_address
      t.integer :port, limit: 3
      t.integer :ftime, limit: 3
      t.integer :panel, limit: 1

      t.timestamps
    end
  end
end
