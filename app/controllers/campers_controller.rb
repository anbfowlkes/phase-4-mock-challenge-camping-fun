class CampersController < ApplicationController

    def index
        campers = Camper.all
        render json: campers, only: [:id, :name, :age]
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
          render json: camper, serializer: CamperwithactivitySerializer
        else
            render json: { error: "Camper not found" }, status: :not_found
        end
    end

    def create
        camper = Camper.new({name: params[:name], age: params[:age]})
        if camper.save
            render json: camper, status: 201
        else
            render json: {errors: camper.errors.full_messages}, status: 422
        end
    #     camper = Camper.create!({name: params[:name], age: params[:age]})
    #     render json: camper, status: 201
    # rescue ActiveRecord::RecordInvalid => invalid
    #     render json: invalid.record.errors, status: 422
    # end
    end
end
