class CreateOhmysupportTicketCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :ohmysupport_ticket_categories do |t|
      t.string :name, null: false, unique: true

      t.timestamps
    end
  end
end
