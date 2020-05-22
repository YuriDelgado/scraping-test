class JudgementsController < ApplicationController
  before_action :set_judgement, only: [:show, :destroy]

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

  # POST /judgements
  # POST /judgements.json
  def create
    @judgement = PjvScrapingService.call(judgement_params)

    respond_to do |format|
      message = 'Judgement was successfully created.'
      message = 'Judgement was successfully updated.' if @judgement.persisted?
      if @judgement.save
        format.html { redirect_to @judgement, notice: message }
        format.json { render :show, status: :created, location: @judgement }
      else
        format.html { render :new, status: :unprocessable_entity }
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
    def set_judgement
      @judgement = Judgement.find(params[:id])
    end

    def judgement_params
      params.require(:judgement).permit(:url)
    end
end
