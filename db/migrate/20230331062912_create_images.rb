class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :url
      t.boolean :is_active
      t.references :imageable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
