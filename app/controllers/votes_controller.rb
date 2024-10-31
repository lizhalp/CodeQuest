class VotesController < ApplicationController
  def create
    @vote = Vote.find_or_initialize_by(user_id: vote_params[:user_id], content_id: vote_params[:content_id])
    @vote.value = (vote_params[:value].to_i == @vote.value) ? 0 : vote_params[:value].to_i

    if @vote.save
      # Broadcast the Turbo Stream update
      ActionCable.server.broadcast(
        "votes_for_content_#{@vote.content_id}",
        render_to_string(partial: "votes/vote_buttons", locals: { content: @vote.content, user: current_user })
      )

      render turbo_stream: turbo_stream.replace("vote-component-#{@vote.content_id}", partial: "votes/vote_buttons", locals: { content: @vote.content, user: current_user })
    else
      render json: { success: false, error: @vote.errors.full_messages }, status: :unprocessable_entity
    end
  end


  private

  def vote_params
    params.require(:vote).permit(:value, :content_id, :user_id)
  end
end
