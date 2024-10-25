class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      render json: { success: true }
    else
      render json: { success: false, errors: @vote.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:value, :content_id, :user_id)
  end
end
