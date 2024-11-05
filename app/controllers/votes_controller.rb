class VotesController < ApplicationController
  def create
    @vote = Vote.find_or_initialize_by(user_id: vote_params[:user_id], content_id: vote_params[:content_id])
    @vote.value = (vote_params[:value].to_i == @vote.value) ? 0 : vote_params[:value].to_i

    if @vote.save
      content = Content.find(vote_params[:content_id])
      render json: { success: true, new_vote_count: content.vote_sum }, status: :created
    else
      render json: { success: false, error: @vote.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:value, :content_id, :user_id)
  end
end
