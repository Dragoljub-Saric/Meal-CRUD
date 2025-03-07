class Food < ApplicationRecord
    # Validations
    validates :title, presence: true
    validates :total_price, numericality: { greater_than_or_equal_to: 0}
    validates :calories, numericality: { greater_than_or_equal_to: 0 }

    # Associations
    has_many :booked_meals, dependent: :destroy
    has_many :meals, through: :booked_meals
end
