class CreateMessageLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :message_logs do |t|
      t.string :content

      t.datetime :created_at
    end
  end
end
