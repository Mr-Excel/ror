class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  belongs_to :company

  has_many :images, as: :imageable, dependent: :destroy

  has_many :user_teams, dependent: :destroy
  has_many :teams, :through => :user_teams
  has_many :user_departments, dependent: :destroy
  has_many :departments, :through => :user_departments
  has_many :user_roles, dependent: :destroy
  has_many :roles, :through => :user_roles
  has_many :user_dependents, dependent: :destroy
  has_many :dependents, :through => :user_dependents

  # accepts_nested_attributes_for :teams
  accepts_nested_attributes_for :user_teams, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :user_departments, allow_destroy: true
  accepts_nested_attributes_for :dependents, allow_destroy: true
  accepts_nested_attributes_for :user_roles, allow_destroy: true

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
