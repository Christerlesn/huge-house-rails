class CreateVendors < ActiveRecord::Migration[6.1]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :type
      t.text :description
      t.belongs_to :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
