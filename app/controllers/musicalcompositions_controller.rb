class MusicalcompositionsController < ApplicationController
  before_action :set_musicalcomposition, only: %i[ show edit update destroy ]
layout false, only: [:songs]
  # GET /musicalcompositions or /musicalcompositions.json
  def json
    @musicalcompositions=Musicalcomposition.findbyname(params[:name])
    render json: @musicalcompositions
  end
 def songs
    @songs = Song.findbyid(params[:id])
 end
  def index
    @musicalcompositions = Musicalcomposition.all
  end

  # GET /musicalcompositions/1 or /musicalcompositions/1.json
  def show
    @song = @musicalcomposition.machanson
  end

  # GET /musicalcompositions/new
  def new
    @musicalcomposition = Musicalcomposition.new
  end

  # GET /musicalcompositions/1/edit
  def edit
  end

  # POST /musicalcompositions or /musicalcompositions.json
  def create
    @musicalcomposition = Musicalcomposition.new(musicalcomposition_params)

    respond_to do |format|
      if @musicalcomposition.save
        format.html { redirect_to ((@musicalcomposition.couplets[0]||@musicalcomposition.refrains[0]).songs[0]), notice: "Musicalcomposition was successfully created." }
        format.json { render :show, status: :created, location: @musicalcomposition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @musicalcomposition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /musicalcompositions/1 or /musicalcompositions/1.json
  def update
    respond_to do |format|
      if @musicalcomposition.update(musicalcomposition_params)
        format.html { redirect_to @musicalcomposition.machanson, notice: "Musicalcomposition was successfully updated." }
        format.json { render :show, status: :ok, location: @musicalcomposition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @musicalcomposition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /musicalcompositions/1 or /musicalcompositions/1.json
  def destroy
    @musicalcomposition.destroy
    respond_to do |format|
      format.html { redirect_to musicalcompositions_url, notice: "Musicalcomposition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_musicalcomposition
      @musicalcomposition = Musicalcomposition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def musicalcomposition_params
      params.require(:musicalcomposition).permit(:title,:composer_attributes=>{},:compohaverecipients_attributes=>{},:recipient_ids=>[],:song_ids=>[])
    end
end
