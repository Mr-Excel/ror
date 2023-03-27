class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :user_teams, dependent: :destroy
  has_many :teams, :through => :user_teams

  # Validations
  validates :email, presence: true, uniqueness: {:case_sensitive => false}
  validates :gender, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  # Self Methods 
  def age
    return nil if date_of_birth.nil?
    return 0 if Date.today < date_of_birth 
    days_in_a_year = 365
    now = Time.current.to_date
    diff = (now - date_of_birth)
    (diff / days_in_a_year).floor
  end

  # Enums Declaration
  enum gender: [:male, :female]

  # Scopes
  scope :males, -> { where(:gender => 0)}
  scope :females, -> { where(:gender => 1)}
  scope :teams, ->(status = nil) { status.nil? == true ? joins(:teams) : joins(:teams).where(:user_teams => {:is_active => status}) }
  scope :select_all, ->(status = nil) { teams(status).select("users.id,users.first_name,users.last_name,users.email,users.gender,users.date_of_birth,teams.id as team_id,teams.name as team_name").distinct }
end
