class RecordingreviewsController < ApplicationController
  before_action :set_recordingreview, only: %i[ show edit update destroy ]

layout false, only: [:scorecriteria, :barcriteria]

  def scorecriteria
@scorecriteria=Scorecriterion.findbyid(params[:id])
  end
  def barcriteria
@barcriteria=Barcriterion.findbyid(params[:id])
  end

  # GET /recordingreviews or /recordingreviews.json
  def index
    @recordingreviews = Recordingreview.all
  end

  # GET /recordingreviews/1 or /recordingreviews/1.json
  def show
    @barattempt = @recordingreview.barattempts[0]
  end

  # GET /recordingreviews/new
  def new
    @recordingreview = Recordingreview.new(gooduser: current_user)
    @barattempt = Barattempt.find(params[:barattemptid])
@barattempt.recordingreviews.new(gooduser: current_user)
  end

  # GET /recordingreviews/1/edit
  def edit
    @barattempt = @recordingreview.barattempts[0]
  end

  # POST /recordingreviews or /recordingreviews.json
  def create
    @recordingreview = Recordingreview.new(recordingreview_params)


    respond_to do |format|
      if @recordingreview.save
        format.html { redirect_to @recordingreview, notice: "Recordingreview was successfully created." }
        format.json { render :show, status: :created, location: @recordingreview }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recordingreview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recordingreviews/1 or /recordingreviews/1.json
  def update
    respond_to do |format|
      if @recordingreview.update(recordingreview_params)
        format.html { redirect_to @recordingreview, notice: "Recordingreview was successfully updated." }
        format.json { render :show, status: :ok, location: @recordingreview }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recordingreview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recordingreviews/1 or /recordingreviews/1.json
  def destroy
    @recordingreview.destroy
    respond_to do |format|
      format.html { redirect_to recordingreviews_url, notice: "Recordingreview was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recordingreview
      @recordingreview = Recordingreview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recordingreview_params
      params.require(:recordingreview).permit(:correctsampleid,:contentcorrectsamplerecording,:contentincorrectsamplerecording, :incorrectsample_id, :gooduser_id, :correctsamplerecording=>[],:incorrectsamplerecording=>[],:recordingreviews_attributes=>{},:barcriterion_ids=>[],:scorecriterion_ids=>[])
    end
end
