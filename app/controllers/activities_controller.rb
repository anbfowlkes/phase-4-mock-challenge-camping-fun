class ActivitiesController < ApplicationController

    def index
        render json: Activity.all
    end

    def destroy
        activity = Activity.find_by(id: params[:id])
        if activity
          signups = activity.signups
          activity.destroy
          signups.destroy_all
          render json: {}
        else
            render json: { error: "Activity not found" }, status: 404
        end
    end
end
