class VotesController < ApplicationController
  def create
    Vote.find_or_initialize_by(content_id: vote_params[:content_id], user_id: vote_params[:user_id]).tap do |vote|
      vote.value = vote_params[:value]
      if vote.save
        render json: { success: true }
      else
        render json: { success: false, errors: vote.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:value, :content_id, :user_id)
  end
end
