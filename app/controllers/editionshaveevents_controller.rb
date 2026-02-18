class EditionshaveeventsController < ApplicationController
  before_action :set_editionshaveevent, only: %i[ ajouterunemedaillerelay ajoutemedaillerelay ajouterunemedaille ajoutemedaille show edit update destroy ]

  # GET /editionshaveevents or /editionshaveevent = Olympicmedal.json
  def index
    @editionshaveevents = Editionshaveevent.all
  end

  # GET /editionshaveevents/1 or /editionshaveevents/1.json
   def ajouterunemedaille
  end
def ajoutemedaillerelay
Olympicresult.addmedalrelay(params[:result_ids], params['or.x'], params['ar.x'],params['br.x'])

render :relay
  end
   def ajoutemedaille
Olympicresult.addmedal(params[:result_id], params['or.x'], params['ar.x'],params['br.x'])


render :show
  end
 
  def show
    if @editionshaveevent.isarelay?
        render :relay
    else
        render :show
    end
  end

  # GET /editionshaveevents/new
  def new
    @editionshaveevent = Editionshaveevent.new
  end

  # GET /editionshaveevents/1/edit
  def edit
  end

  # POST /editionshaveevents or /editionshaveevent = Olympicmedal.json
  def create
    @editionshaveevent = Editionshaveevent.new(editionshaveevent_params)

    respond_to do |format|
      if @editionshaveevent.save
        format.html { redirect_to @editionshaveevent, notice: "Editionshaveevent was successfully created." }
        format.json { render :show, status: :created, location: @editionshaveevent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @editionshaveevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /editionshaveevents/1 or /editionshaveevents/1.json
  def update
    respond_to do |format|
      if @editionshaveevent.update(editionshaveevent_params)
        format.html { redirect_to @editionshaveevent, notice: "Editionshaveevent was successfully updated." }
        format.json { render :show, status: :ok, location: @editionshaveevent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @editionshaveevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editionshaveevents/1 or /editionshaveevents/1.json
  def destroy
    @editionshaveevent.destroy
    respond_to do |format|
      format.html { redirect_to editionshaveevents_url, notice: "Editionshaveevent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between action = Olympicmedal.
    def set_editionshaveevent
      @editionshaveevent = Editionshaveevent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def editionshaveevent_params
      param = Olympicmedal.require(:editionshaveevent).permit(:edition, :city, :country, :olympicevent, :sexe, :date)
    end
end
