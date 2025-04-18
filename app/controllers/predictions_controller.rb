class PredictionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @prediction = current_user.predictions.find_or_initialize_by(matchup_id: params[:matchup_id])
    @prediction.assign_attributes(
      predicted_winner_id: params[:predicted_winner_id],
      games_in_series: params[:games_in_series]
    )

    if @prediction.save
      redirect_back fallback_location: root_path, notice: "Prediction saved!"
    else
      redirect_back fallback_location: root_path, alert: "Error saving prediction."
    end
  end

  def destroy
    prediction = current_user.predictions.find(params[:id])
    prediction.destroy
    redirect_back fallback_location: root_path, notice: "Prediction deleted."
  end
end
