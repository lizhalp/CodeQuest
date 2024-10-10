class LanguagesController < ApplicationController
  before_action :set_language, only: %i[ show update destroy ]

  # GET /languages
  def index
    @languages = Language.all

    render json: @languages
  end

  # GET /languages/1
  def show
    render json: @language
  end

  # POST /languages
  def create
    @language = Language.new(language_params)

    if @language.save
      render json: @language, status: :created, location: @language
    else
      render json: @language.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /languages/1
  def update
    if @language.update(language_params)
      render json: @language
    else
      render json: @language.errors, status: :unprocessable_entity
    end
  end

  # DELETE /languages/1
  def destroy
    @language.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_language
      @language = Language.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def language_params
      params.expect(language: [ :judge_id, :driver, :name ])
    end
end
