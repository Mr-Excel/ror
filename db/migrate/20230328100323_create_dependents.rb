class CreateDependents < ActiveRecord::Migration[7.0]
  def change
    create_table :dependents do |t|
      t.string :name
      t.integer :gender

      t.timestamps
    end
  end
end
