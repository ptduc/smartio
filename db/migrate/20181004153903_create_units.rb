class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.string :unit_code
      t.string :name
      t.string :address
      t.text :description
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
