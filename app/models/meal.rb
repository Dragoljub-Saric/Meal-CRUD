class Meal < ApplicationRecord
    # Validations
    validates :date, presence: true
    validates :time, presence: true
    validates :total_price, numericality: { greater_than_or_equal_to: 0 }
    validates :total_calories, numericality: { greater_than_or_equal_to: 0 }

    # Associations
    belongs_to :user
    has_many :booked_meals,dependent: :destroy
    has_many :foods, through: :booked_meals

    # Callback to calculate the total calories and price before saving
    before_save :calculate_totals

    private

    def calculate_totals
      self.total_price = foods.sum(:price)
      self.total_calories = foods.sum(:calories)
    end
  end
end
