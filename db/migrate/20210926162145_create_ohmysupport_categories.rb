class CreateOhmysupportCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :ohmysupport_categories do |t|
      t.string :name, null: false, unique: true
      t.text :description, null: false
      t.string :state, null: false, default: 'disabled'

      t.timestamps
    end
  end
end
