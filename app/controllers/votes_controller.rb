# frozen_string_literal: true

class VotesController < ApplicationController
  before_action :set_voteable
  before_action :set_vote, only: %i[destroy]

  def create
    @vote = @voteable.votes.new(vote_params)
    @vote.user = current_user

    if @vote.save
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = @vote.errors.full_messages.join(", ")
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @vote.destroy
    flash[:notice] = "Vote was successfully destroyed."
    redirect_back(fallback_location: root_path)
  end

  private

  def vote_params
    params.require(:vote).permit(:value, :voteable_id, :voteable_type)
  end

  def set_vote
    @vote = Vote.find(params[:id])
  end
end
