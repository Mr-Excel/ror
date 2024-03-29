class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name

      t.timestamps
    end
    add_reference :users, :company, foreign_key: true
  end
end
