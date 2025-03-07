class BookedFoodsController < ApplicationController
    before_action :set_booked_food only: [:show, :update, :destroy]

    #GET /booked_foods/ - Fetch all booked foods
    def index
        @booked_foods = BookedMeal.all
        render json: @booked_foods
    end

    #GET /booked_foods/ - Show a booked food
    def show
        render json: @booked_food
    end

    #PUT /booked_foods/:id - Update a booked food
    def update
        if @booked_food.update(booked_food_params)
            render json: @booked_food
        else
            render json: @booked_food.errors, status: :unprocessable_entity
        end
    end

    #POST /booked_foods/ - Create a booked food
    def create
        @booked_food = new BookedFood(booked_food_params)
        if @booked_food_params.save
            render json: @booked_food
        else
            render json: @booked_food.errors, status: :unprocessable_entity
        end
    end

    #DELETE /booked_foods/ - Delete a booked food data
    def destroy
        @booked_food.destroy
        render json: :no_content
    end

    def set_booked_food 
        @booked_food = BookedFood.find(params[:id])
    end

    def booked_food_params
        params.require(:booked_food).permit(:meal, :food)
    end

end
