class AidememoiresController < ApplicationController
  before_action :set_aidememoire, only: %i[ show edit update destroy ]

  # GET /aidememoires or /aidememoires.json
  def index
    @aidememoires = Aidememoire.bypage(params[:page].to_i)
  end

  # GET /aidememoires/1 or /aidememoires/1.json
  def show
  end

  # GET /aidememoires/new
  def new
    @aidememoire = Aidememoire.new
  end

  # GET /aidememoires/1/edit
  def edit
  end

  # POST /aidememoires or /aidememoires.json
  def create
    @aidememoire = Aidememoire.new(aidememoire_params)

    respond_to do |format|
      if @aidememoire.save
        format.html { redirect_to @aidememoire, notice: "Aidememoire was successfully created." }
        format.json { render :show, status: :created, location: @aidememoire }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @aidememoire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aidememoires/1 or /aidememoires/1.json
  def update
    respond_to do |format|
      if @aidememoire.update(aidememoire_params)
        format.html { redirect_to @aidememoire, notice: "Aidememoire was successfully updated." }
        format.json { render :show, status: :ok, location: @aidememoire }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @aidememoire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aidememoires/1 or /aidememoires/1.json
  def destroy
    @aidememoire.destroy
    respond_to do |format|
      format.html { redirect_to aidememoires_url, notice: "Aidememoire was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aidememoire
      @aidememoire = Aidememoire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def aidememoire_params
      params.require(:aidememoire).permit(:contentmyownphrasesandwords1, :contentmyownphrasesandwords2, :recordingphrase_id, :recordingword_id,:linkedtask_ids=>[],:recordmyphrasesandwords=>[], :sailorhavingthistask=>[],:recordmywords=>[],:mytaskwiththerecording=>[],:myownphrasesandwords=>[], :contentmyownphrasesandwords=>[], :myownwords=>[],:contentmyownwords=>[], :recordmyphrasesandwords1=>[],:recordmywords1=>[],:myownphrasesandwords1=>[],:contentmyownphrasesandwords1=>[],:myownwords1=>[],:contentmyownwords1=>[],:recordmyphrasesandwords2=>[],:recordmywords2=>[],:myownphrasesandwords2=>[],:contentmyownphrasesandwords2=>[],:myownwords2=>[],:contentmyownwords2=>[],:addmyrelation_id=>[], :addmyrelation_text=>[],:addmybigrelation_id=>[],:addmymiddlerelation_id=>[], :mysailorsgetter=>[])
    end
end
