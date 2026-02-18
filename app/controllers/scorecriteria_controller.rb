class ScorecriteriaController < ApplicationController
  before_action :set_scorecriterion, only: %i[ show edit update destroy ]

  def json
    @scorecriteria = Scorecriterion.findbyname(params[:name])
    render json: @scorecriteria
  end

  # GET /scorecriteria or /scorecriteria.json
  def index
    @scorecriteria = Scorecriterion.all
  end

  # GET /scorecriteria/1 or /scorecriteria/1.json
  def show
  end

  # GET /scorecriteria/new
  def new
    @scorecriterion = Scorecriterion.new(musicalscore_id: params[:scoreid], gooduser: current_user)
  end

  # GET /scorecriteria/1/edit
  def edit
  end

  # POST /scorecriteria or /scorecriteria.json
  def create
    @scorecriterion = Scorecriterion.new(scorecriterion_params)

    respond_to do |format|
      if @scorecriterion.save
        format.html { redirect_to @scorecriterion, notice: "Scorecriterion was successfully created." }
        format.json { render :show, status: :created, location: @scorecriterion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @scorecriterion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scorecriteria/1 or /scorecriteria/1.json
  def update
    respond_to do |format|
      if @scorecriterion.update(scorecriterion_params)
        format.html { redirect_to @scorecriterion, notice: "Scorecriterion was successfully updated." }
        format.json { render :show, status: :ok, location: @scorecriterion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @scorecriterion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scorecriteria/1 or /scorecriteria/1.json
  def destroy
    @scorecriterion.destroy
    respond_to do |format|
      format.html { redirect_to scorecriteria_url, notice: "Scorecriterion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scorecriterion
      @scorecriterion = Scorecriterion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scorecriterion_params
      params.require(:scorecriterion).permit(:description, :gooduser_id, :musicalscore_id)
    end
end
