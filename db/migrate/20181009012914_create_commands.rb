class CreateCommands < ActiveRecord::Migration[5.2]
  def change
    create_table :commands do |t|
      t.references :device, foreign_key: true
      t.string :code
      t.integer :action, limit: 1
      t.text :command
      t.integer :status, limit: 1, default: 0

      t.timestamps
    end
  end
end
