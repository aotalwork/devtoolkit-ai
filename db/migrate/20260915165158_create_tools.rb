class CreateTools < ActiveRecord::Migration[8.0]
  def change
    create_table :tools do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.text :description
      t.string :icon
      t.boolean :active, null: false, default: true

      t.timestamps
    end

    add_index :tools, :slug, unique: true
  end
end