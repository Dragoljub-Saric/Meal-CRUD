class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    # Validations
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    # Associations
    has_many :meals
    has_many :booked_meals, through: :meals
    has_many :foods, through: :booked_meals
end
