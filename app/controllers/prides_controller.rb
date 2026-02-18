class PridesController < ApplicationController
  before_action :set_pride, only: %i[ show edit update destroy ]

  layout false, only: [:instructions]
  # GET /prides or /prides.json
  def instructions
    @instructions=Instruction.findbyid(params[:id])
  end
  def index
    @prides = Pride.all
  end

  # GET /prides/1 or /prides/1.json
  def show
  end

  # GET /prides/new
  def new
    @pride = Pride.new
  end

  # GET /prides/1/edit
  def edit
  end

  # POST /prides or /prides.json
  def create
    @pride = Pride.new(pride_params)

    respond_to do |format|
      if @pride.save
        format.html { redirect_to @pride, notice: "Pride was successfully created." }
        format.json { render :show, status: :created, location: @pride }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pride.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prides/1 or /prides/1.json
  def update
    respond_to do |format|
      if @pride.update(pride_params)
        format.html { redirect_to @pride, notice: "Pride was successfully updated." }
        format.json { render :show, status: :ok, location: @pride }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pride.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prides/1 or /prides/1.json
  def destroy
    @pride.destroy
    respond_to do |format|
      format.html { redirect_to prides_url, notice: "Pride was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pride
      @pride = Pride.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pride_params
      params.require(:pride).permit(:content_en, :content_fr, :content_de,:instruction_ids=>[],:job_ids=>[])
    end
end
