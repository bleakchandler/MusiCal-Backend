class DaysController < ApplicationController
        def index
            @days = Day.all
            render json: Day.day_array_to_json(@days)
        end    
    
        def show
            @day = Day.find(params[:id])
            render json: @day.to_json
        end    
    
    
        def new
            @day = Day.new
    
            render json: @day
        end
    
        def create
            @day = Day.create(day_params)
    
            render json: @day.to_json
        end
    
        def destroy
            @day = Day.find(params[:id])  
            @day.destroy
        end
    
        def update
            @day = Day.find(params[:id])
            @day.update(day_params)
    
            render json: @day
        end
    
        private
    
        def day_params
            params.require(:day).permit(:date, :note, :user_id)
        end
end