class RivalsController < ApplicationController
  before_action :set_rival, only: %i[ show edit update destroy ]
  layout false, only: [:reallover,:fakelover, :rivalpeople]
  before_action :searchpeople, only: [:reallover,:fakelover, :rivalpeople]
  def rivalpeople
  end
  def fakelover
  end
  def reallover
  end
  # GET /rivals or /rivals.json
  def index
    @rivals = Rival.all
  end

  # GET /rivals/1 or /rivals/1.json
  def show
  end

  # GET /rivals/new
  def new
    @rival = Rival.new
  end

  # GET /rivals/1/edit
  def edit
  end

  # POST /rivals or /rivals.json
  def create
    @rival = Rival.new(rival_params)

    respond_to do |format|
      if @rival.save
        format.html { redirect_to @rival, notice: "Rival was successfully created." }
        format.json { render :show, status: :created, location: @rival }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rival.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rivals/1 or /rivals/1.json
  def update
    respond_to do |format|
      if @rival.update(rival_params)
        format.html { redirect_to @rival, notice: "Rival was successfully updated." }
        format.json { render :show, status: :ok, location: @rival }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rival.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rivals/1 or /rivals/1.json
  def destroy
    @rival.destroy
    respond_to do |format|
      format.html { redirect_to rivals_url, notice: "Rival was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def searchpeople
      @people=Person.findbyid(params[:id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_rival
      @rival = Rival.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rival_params
      params.require(:rival).permit(:fakelover_id, :reallover_id,:rivalperson_ids=>[])
    end
end
