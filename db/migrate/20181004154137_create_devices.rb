class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :code
      t.references :unit, foreign_key: true
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
