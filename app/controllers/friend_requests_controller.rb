# frozen_string_literal: true

class FriendRequestsController < ApplicationController
  before_action :set_friend_request, only: %i[update destroy]

  # POST /friend_requests or /friend_requests.json
  def create
    @friend_request = FriendRequest.new(friend_request_params)

    respond_to do |format|
      if @friend_request.save
        format.html { redirect_to @friend_request, notice: "Friend request was successfully created." }
        format.json { render :show, status: :created, location: @friend_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friend_requests/1 or /friend_requests/1.json
  def update
    respond_to do |format|
      if @friend_request.update(friend_request_params)
        format.html { redirect_to @friend_request, notice: "Friend request was successfully updated." }
        format.json { render :show, status: :ok, location: @friend_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friend_requests/1 or /friend_requests/1.json
  def destroy
    @friend_request.destroy!

    respond_to do |format|
      format.html do
        redirect_to friend_requests_path, status: :see_other, notice: "Friend request was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_friend_request
    @friend_request = FriendRequest.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def friend_request_params
    params.expect(friend_request: [:sender_id, :recipient_id, :accepted])
  end
end
