class JudgementsController < ApplicationController
  before_action :set_judgement, only: [:show, :edit, :update, :destroy]

  # GET /judgements
  # GET /judgements.json
  def index
    @judgements = Judgement.all
  end

  # GET /judgements/1
  # GET /judgements/1.json
  def show
  end

  # GET /judgements/new
  def new
    @judgement = Judgement.new
  end

  # GET /judgements/1/edit
  def edit
  end

  # POST /judgements
  # POST /judgements.json
  def create
    @judgement = PjvScrapingService.call(judgement_url_params[:judgement_url])

    respond_to do |format|
      message = 'Judgement was successfully created.'
      message = 'Judgement was successfully updated.' if @judgement.persisted?
      if @judgement.save
        format.html { redirect_to @judgement, notice: message }
        format.json { render :show, status: :created, location: @judgement }
      else
        format.html { render :new }
        format.json { render json: @judgement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /judgements/1
  # PATCH/PUT /judgements/1.json
  def update
    respond_to do |format|

      if @judgement.update(judgement_params)
        format.html { redirect_to @judgement, notice: 'Judgement was successfully updated.' }
        format.json { render :show, status: :ok, location: @judgement }
      else
        format.html { render :edit }
        format.json { render json: @judgement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /judgements/1
  # DELETE /judgements/1.json
  def destroy
    @judgement.destroy
    respond_to do |format|
      format.html { redirect_to judgements_url, notice: 'Judgement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_judgement
      @judgement = Judgement.find(params[:id])
    end

    def judgement_url_params
      params.require(:judgement).permit(:judgement_url)
    end

    # Only allow a list of trusted parameters through.
    def judgement_params
      params.require(:judgement).permit(:file_number, :claimant, :defendant, :summary, :court_table, :notifications_id)
    end
end
