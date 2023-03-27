class AddIndexOverUserColumns < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :id, unique: true
    add_index :users, :gender
    add_index :users, :created_at
  end
end
