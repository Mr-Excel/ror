class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: {:case_sensitive => false}
  validates :gender, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def age

    return nil if date_of_birth.nil?
    return 0 if Date.today < date_of_birth 
    days_in_a_year = 365
    now = Time.current.to_date
    diff = (now - date_of_birth)
    (diff / days_in_a_year).floor
  end

  # scope :name, -> { where(:attibute => value)}
  # Ex:- scope :active, -> {where(:active => true)}
end
