class RepasController < ApplicationController
  before_action :set_repas, only: %i[ show edit update destroy ]

  # GET /repas or /repas.json
  def index
    @repas = Repas.all
  end

  # GET /repas/1 or /repas/1.json
  def show
  end

  # GET /repas/new
  def new
    @repas = Repas.new(user_id: current_user.id)
  end

  # GET /repas/1/edit
  def edit
  end

  # POST /repas or /repas.json
  def create
    @repas = Repas.new(repas_params)

    respond_to do |format|
      if @repas.save
        format.html { redirect_to @repas, notice: "Repas was successfully created." }
        format.json { render :show, status: :created, location: @repas }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @repas.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repas/1 or /repas/1.json
  def update
    respond_to do |format|
      if @repas.update(repas_params)
        format.html { redirect_to @repas, notice: "Repas was successfully updated." }
        format.json { render :show, status: :ok, location: @repas }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @repas.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repas/1 or /repas/1.json
  def destroy
    @repas.destroy
    respond_to do |format|
      format.html { redirect_to repas_index_url, notice: "Repas was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repas
      @repas = Repas.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def repas_params
      params.require(:repas).permit(:user_id, :somme, :date,:menuids=>[])
    end
end
