class ContentsController < ApplicationController
  before_action :set_content, only: %i[ show edit update destroy view ]

  # GET /contents/1 or /contents/1.json
  def show
  end

  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit
  end

  def create
    @content = Content.new(content_params)

    respond_to do |format|
      if @content.save
        flash[:success] = "Content was successfully created."
        format.html { redirect_to @content }
        format.json { render :show, status: :created, location: @content }
      else
        flash[:danger] = @content.errors.full_messages.join(", ")
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contents/1 or /contents/1.json
  def update
    respond_to do |format|
      if @content.update(content_params)
        flash[:success] = "Content was successfully updated."
        format.html { redirect_to @content }
        format.json { render :show, status: :ok, location: @content }
      else
        flash[:alert] = @content.errors.full_messages.join(", ")
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  def view
    Completion.create user: Current.user, content: @content
    flash[:success] = "Succesfully completed #{@content.title}"
    redirect_to topics_path
  end

  # DELETE /contents/1 or /contents/1.json
  def destroy
    @content.destroy!

    respond_to do |format|
      flash[:success] = "Content was successfully destroyed."
      format.html { redirect_to topics_path, status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def content_params
      params.expect(content: [ :user_id, :title, :content_text, :topic_id, :type ])
    end
end
