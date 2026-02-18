class SalutmilitairesController < ApplicationController
  before_action :set_salutmilitaire, only: %i[ show edit update destroy ]

  # GET /salutmilitaires or /salutmilitaires.json
  def index
    @salutmilitaires = Salutmilitaire.all
  end

  # GET /salutmilitaires/1 or /salutmilitaires/1.json
  def show

@t=@salutmilitaire.tickets.new
@t.sender= @salutmilitaire.persona.try(:name)
@t.recipient= @salutmilitaire.personb.try(:name)

  end

  # GET /salutmilitaires/new
  def new
    @salutmilitaire = Salutmilitaire.new
  end

  # GET /salutmilitaires/1/edit
  def edit
  end

  # POST /salutmilitaires or /salutmilitaires.json
  def create
    @salutmilitaire = Salutmilitaire.new(salutmilitaire_params)

    respond_to do |format|
      if @salutmilitaire.save
        format.html { redirect_to @salutmilitaire, notice: "Salutmilitaire was successfully created." }
        format.json { render :show, status: :created, location: @salutmilitaire }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @salutmilitaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salutmilitaires/1 or /salutmilitaires/1.json
  def update
    respond_to do |format|
      if @salutmilitaire.update(salutmilitaire_params)
        format.html { redirect_to @salutmilitaire, notice: "Salutmilitaire was successfully updated." }
        format.json { render :show, status: :ok, location: @salutmilitaire }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @salutmilitaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salutmilitaires/1 or /salutmilitaires/1.json
  def destroy
    @salutmilitaire.destroy
    respond_to do |format|
      format.html { redirect_to salutmilitaires_url, notice: "Salutmilitaire was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salutmilitaire
      @salutmilitaire = Salutmilitaire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def salutmilitaire_params
      params.require(:salutmilitaire).permit(:tickets_attributes=>{})
    end
end
