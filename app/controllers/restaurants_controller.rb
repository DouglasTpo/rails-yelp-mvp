 class RestaurantsController < ApplicationController
before_action :set_restaurants, only: %i[show edit update destroy]

    def index
        
        @restaurants = Restaurant.all

    end
    

    def show
        @restaurant = Restaurant.find(params[:id])
    end

    def new
        @restaurant = Restaurant.new

    end
    
    def create
        @restaurant = Restaurant.new(restaurant_params)
        if @restaurant.save
            redirect_to restaurant_path(@restaurant)
          else
            render :new, status: :unprocessable_entity
          end
    end

    def edit
    end

    def update
        @restaurant.update(restaurant_params)
    
        redirect_to restaurant_path(@restaurant)
      end
    
      def destroy
        @restaurant.destroy
    
        redirect_to restaurants_path
      end


    private

    def restaurant_params
        params.require(@restaurant).permit(:name, :address, :phone_number, :category)
    end


    def set_restaurants
    
        @restaurant = Restaurant.find(params[:id])
    
    end

 end
