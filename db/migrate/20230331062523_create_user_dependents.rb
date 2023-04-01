class CreateUserDependents < ActiveRecord::Migration[7.0]
  def change
    create_table :user_dependents do |t|
      t.references :user, null: false, foreign_key: true
      t.references :dependent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
