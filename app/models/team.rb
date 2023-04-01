class Team < ApplicationRecord
  has_many :user_teams, dependent: :destroy
  has_many :users, :through => :user_teams
  # accepts_nested_attributes_for :user_teams
end
