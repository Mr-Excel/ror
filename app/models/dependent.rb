class Dependent < ApplicationRecord
  has_many :user_dependents, dependent: :destroy
  has_many :users, through: :user_dependents
  belongs_to :relationship
end
