class User < ApplicationRecord
    # Validations
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    # Associations
    has_many :meals
    has_many :booked_meals, through: :meals
    has_many :foods, through: :booked_meals
end
