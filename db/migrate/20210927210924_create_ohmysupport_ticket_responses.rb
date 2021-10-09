class CreateOhmysupportTicketResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :ohmysupport_ticket_responses do |t|
      t.integer :author_id, null: false
      t.string :author_type, null: false
      t.integer :ticket_id, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
