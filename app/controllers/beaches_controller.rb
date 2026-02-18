class BeachesController < ApplicationController
  before_action :set_beach, only: %i[ nouvelaidememoire show edit update destroy newstreet]
def newstreet
@beach.streets.new
render :edit
end
  def nouvelaidememoire
    begin
    @beach.update(beach_params)
    rescue => e
      p e.message

    @beach=Beach.new
    end
    render layout: false, locals: {task: @beach}
  end

  # GET /beaches or /beaches.json
  def index
    @beaches = Beach.all
  end

  # GET /beaches/1 or /beaches/1.json
  def show
  end

  # GET /beaches/new
  def new
    @beach = Beach.new
  end

  # GET /beaches/1/edit
  def edit
  end

  # POST /beaches or /beaches.json
  def create
    @beach = Beach.new(beach_params)

    respond_to do |format|
      if @beach.save
        format.html { redirect_to @beach, notice: "Beach was successfully created." }
        format.json { render :show, status: :created, location: @beach }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @beach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beaches/1 or /beaches/1.json
  def update
    respond_to do |format|
      if @beach.update(beach_params)
        format.html { redirect_to @beach, notice: "Beach was successfully updated." }
        format.json { render :show, status: :ok, location: @beach }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @beach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beaches/1 or /beaches/1.json
  def destroy
    @beach.destroy
    respond_to do |format|
      format.html { redirect_to beaches_url, notice: "Beach was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beach
      @beach = Beach.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def beach_params
      params.require(:beach).permit(:address_id, :name,:myislandids,:recordmyphrasesandwords=>[], :sailorhavingthistask=>[],:recordmywords=>[],:mytaskwiththerecording=>[],:myownphrasesandwords=>[], :contentmyownphrasesandwords=>[], :myownwords=>[],:contentmyownwords=>[], :recordmyphrasesandwords1=>[],:recordmywords1=>[],:myownphrasesandwords1=>[],:contentmyownphrasesandwords1=>[],:myownwords1=>[],:contentmyownwords1=>[],:recordmyphrasesandwords2=>[],:recordmywords2=>[],:myownphrasesandwords2=>[],:contentmyownphrasesandwords2=>[],:myownwords2=>[],:contentmyownwords2=>[],:addmyrelation_id=>[], :addmyrelation_text=>[],:addmybigrelation_id=>[],:addmymiddlerelation_id=>[], :mysailorsgetter=>[],:streets_attributes=>{})
    end
end
