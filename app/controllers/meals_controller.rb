class MealsController < ApplicationController
    before_action :set_meal, only: [:show, :update, :destroy]

    def index
        @meals = Meal.all
        render json: @meals
    end

    def show
        render json: @meal
    end

    def create
        @meal = Meal.new(meal_params)
        authorize @meal  # Pundit will call MealPolicy to check authorization
        if @meal.save
            render json: @meal, status: :created
        else
            render json: { error: 'Failed to create meal' }, status: :unprocessable_entity
        end
    end

    def update
        authorize @meal
        if @meal.update(meal_params)
            render json: @meal
        else
            render json: { error: 'Failed to create meal' }, status: :unprocessable_entity
        end
    end

    def destroy
        authorize @meal
        @meal.destroy
    end

    private

    def set_meal
        @meal = Meal.find(params[:id])
    end

    def meal_params
        params.require(:meal).permit(:user_id, :date, :time, food_ids: [])
    end
end
