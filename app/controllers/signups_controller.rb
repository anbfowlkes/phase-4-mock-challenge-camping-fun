class SignupsController < ApplicationController

    def create
        signup = Signup.new(time: params[:time], camper_id: params[:camper_id], activity_id: params[:activity_id])
        if signup.save
            activity = signup.activity
            render json: activity, status: 201
        else
            render json: { errors: signup.errors.full_messages }, status: 422
        end
    #     signup = Signup.create!(time: params[:time], camper_id: params[:camper_id], activity_id: params[:activity_id])
    #     # activity = Activity.find_by(id: params[:activity_id])
    #     # render json: activity
    #     activity = signup.activity
    #     render json: activity, status: 201
    # rescue ActiveRecord::RecordInvalid => invalid
    #     render json: invalid.record.errors, status: 422
    end


end
