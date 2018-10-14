class CreateDota < ActiveRecord::Migration[5.2]
  def change
    create_table :dota do |t|
      t.string :name_version
      t.integer :action, limit: 1
      t.string :ip_address
      t.integer :port, limit: 2
      t.string :user
      t.string :pass
      t.string :name
      t.string :path
      t.string :note

      t.timestamps
    end
  end
end
