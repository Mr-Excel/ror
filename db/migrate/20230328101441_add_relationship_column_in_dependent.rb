class AddRelationshipColumnInDependent < ActiveRecord::Migration[7.0]
  def change
    add_reference :dependents, :relationship, foreign_key: true
  end
end
