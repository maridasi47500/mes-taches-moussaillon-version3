class HistoricaleventsController < ApplicationController
  before_action :set_historicalevent, only: %i[ show edit update destroy ]

  # GET /historicalevents or /historicalevents.json
  def index
    @historicalevents = Historicalevent.all
  end

  # GET /historicalevents/1 or /historicalevents/1.json
  def show
  end

  # GET /historicalevents/new
  def new
    @historicalevent = Historicalevent.new
  end

  # GET /historicalevents/1/edit
  def edit
  end

  # POST /historicalevents or /historicalevents.json
  def create
    @historicalevent = Historicalevent.new(historicalevent_params)

    respond_to do |format|
      if @historicalevent.save
        format.html { redirect_to @historicalevent, notice: "Historicalevent was successfully created." }
        format.json { render :show, status: :created, location: @historicalevent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @historicalevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historicalevents/1 or /historicalevents/1.json
  def update
    respond_to do |format|
      if @historicalevent.update(historicalevent_params)
        format.html { redirect_to @historicalevent, notice: "Historicalevent was successfully updated." }
        format.json { render :show, status: :ok, location: @historicalevent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @historicalevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historicalevents/1 or /historicalevents/1.json
  def destroy
    @historicalevent.destroy
    respond_to do |format|
      format.html { redirect_to historicalevents_url, notice: "Historicalevent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historicalevent
      @historicalevent = Historicalevent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def historicalevent_params
      params.require(:historicalevent).permit(:name, :image)
    end
end
