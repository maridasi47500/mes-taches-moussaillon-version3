class ShaktistatementsController < ApplicationController
  before_action :set_shaktistatement, only: %i[ show edit update destroy ]

  # GET /shaktistatements or /shaktistatements.json
  def index
    @shaktistatements = Shaktistatement.all
  end

  # GET /shaktistatements/1 or /shaktistatements/1.json
  def show
  end

  # GET /shaktistatements/new
  def new
    @shaktistatement = Shaktistatement.new
  end

  # GET /shaktistatements/1/edit
  def edit
  end

  # POST /shaktistatements or /shaktistatements.json
  def create
    @shaktistatement = Shaktistatement.new(shaktistatement_params)

    respond_to do |format|
      if @shaktistatement.save
        format.html { redirect_to @shaktistatement, notice: "Shakti Gauwain's statement was successfully created." }
        format.json { render :show, status: :created, location: @shaktistatement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shaktistatement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shaktistatements/1 or /shaktistatements/1.json
  def update
    respond_to do |format|
      if @shaktistatement.update(shaktistatement_params)
        format.html { redirect_to @shaktistatement, notice: "Shakti Gauwain's statement was successfully updated." }
        format.json { render :show, status: :ok, location: @shaktistatement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shaktistatement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shaktistatements/1 or /shaktistatements/1.json
  def destroy
    @shaktistatement.destroy
    respond_to do |format|
      format.html { redirect_to shaktistatements_url, notice: "Shaktistatement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shaktistatement
      @shaktistatement = Shaktistatement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shaktistatement_params
      params.require(:shaktistatement).permit(:content_fr, :content_en, :content_de)
    end
end
