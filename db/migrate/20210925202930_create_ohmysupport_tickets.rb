class CreateOhmysupportTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :ohmysupport_tickets do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :email
      t.integer :author_id
      t.string :name, null: false
      t.string :state, null: false, default: 'pending'

      t.timestamps
    end
  end
end
