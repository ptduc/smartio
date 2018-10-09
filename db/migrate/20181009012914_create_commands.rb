class CreateCommands < ActiveRecord::Migration[5.2]
  def change
    create_table :commands do |t|
      t.string :code
      t.integer :action
      t.text :command
      t.integer :status

      t.timestamps
    end
  end
end
