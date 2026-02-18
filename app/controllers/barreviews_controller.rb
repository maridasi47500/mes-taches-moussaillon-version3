class BarreviewsController < ApplicationController
  before_action :set_barreview, only: %i[ show edit update destroy ]
layout false, only: [:scorecriteria, :barcriteria]

  # GET /barreviews or /barreviews.json
  def scorecriteria
@scorecriteria=Scorecriterion.findbyid(params[:id])
  end
  def barcriteria
@barcriteria=Barcriterion.findbyid(params[:id])
  end
  def index
    @barreviews = Barreview.all
  end

  # GET /barreviews/1 or /barreviews/1.json
  def show
@barattempt= @barreview.barattempt
  end

  # GET /barreviews/new
  def new
    @barreview = Barreview.new
    @barattempt = Barattempt.find(params[:barattemptid])
@barattempt.barreviews.new

  end

  # GET /barreviews/1/edit
  def edit
@barattempt= @barreview.barattempt
  end

  # POST /barreviews or /barreviews.json
  def create
    @barreview = Barreview.new(barreview_params)

    respond_to do |format|
      if @barreview.save
        format.html { redirect_to @barreview, notice: "Barreview was successfully created." }
        format.json { render :show, status: :created, location: @barreview }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @barreview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barreviews/1 or /barreviews/1.json
  def update
    respond_to do |format|
      if @barreview.update(barreview_params)
        format.html { redirect_to @barreview, notice: "Barreview was successfully updated." }
        format.json { render :show, status: :ok, location: @barreview }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @barreview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barreviews/1 or /barreviews/1.json
  def destroy
    @barreview.destroy
    respond_to do |format|
      format.html { redirect_to barreviews_url, notice: "Barreview was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barreview
      @barreview = Barreview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def barreview_params
      params.require(:barreview).permit(:user_id, :barattempt_id, :description,:scorecriterion_ids=>[],:barcriterion_ids=>[])
    end
end
