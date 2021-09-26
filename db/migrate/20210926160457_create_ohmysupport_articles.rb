class CreateOhmysupportArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :ohmysupport_articles do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :author_id, null: false
      t.integer :category_id, null: false
      t.string :state, null: false, default: 'disabled'

      t.timestamps
    end
  end
end
