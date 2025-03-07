class FoodsController < ApplicationController
   before_action :set_food, only: [:show, :update, :destroy]

   #GET /foods/ - Fetch all foods
   def
        @foods = Food.all
        render json: @foods
   end

    #GET /foods/:id - Show a food data
    def
        render json: @food
    end

    #PUT /food/:id - Update a food data
    def
        if @food.update(food_params)
            render json: @food
        else
            render json: @food.errors, status: :unprocessable_entity
        end
    end

    #POST /foods/ - Create a food data
    def
        @food = new Food(food_params)
        if @food.save
            render json: @food, status: :created
        else
            render json: @food.errors, status: :unprocessable_entity
        end
    end

    #DELETE /foods/:id - Delete a food data
    def
        @food.destroy
        render :no_content
    end

    def set_food
        @food = Food.find(params[:id])        
    end

    def food_params
        params.require(:food).permit(:title, :desc, :price, :calorie)
    end
end
