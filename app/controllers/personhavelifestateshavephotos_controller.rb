class PersonhavelifestateshavephotosController < ApplicationController
  before_action :set_personhavelifestateshavephoto, only: %i[ show edit update destroy ]

  # GET /personhavelifestateshavephotos or /personhavelifestateshavephotos.json
  def index
    @personhavelifestateshavephotos = Personhavelifestateshavephoto.all
  end

  # GET /personhavelifestateshavephotos/1 or /personhavelifestateshavephotos/1.json
  def show
  end

  # GET /personhavelifestateshavephotos/new
  def new
    @personhavelifestateshavephoto = Personhavelifestateshavephoto.new
  end

  # GET /personhavelifestateshavephotos/1/edit
  def edit
  end

  # POST /personhavelifestateshavephotos or /personhavelifestateshavephotos.json
  def create
    @personhavelifestateshavephoto = Personhavelifestateshavephoto.new(personhavelifestateshavephoto_params)

    respond_to do |format|
      if @personhavelifestateshavephoto.save
        format.html { redirect_to @personhavelifestateshavephoto, notice: "Personhavelifestateshavephoto was successfully created." }
        format.json { render :show, status: :created, location: @personhavelifestateshavephoto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personhavelifestateshavephoto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personhavelifestateshavephotos/1 or /personhavelifestateshavephotos/1.json
  def update
    respond_to do |format|
      if @personhavelifestateshavephoto.update(personhavelifestateshavephoto_params)
        format.html { redirect_to @personhavelifestateshavephoto, notice: "Personhavelifestateshavephoto was successfully updated." }
        format.json { render :show, status: :ok, location: @personhavelifestateshavephoto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @personhavelifestateshavephoto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personhavelifestateshavephotos/1 or /personhavelifestateshavephotos/1.json
  def destroy
    @personhavelifestateshavephoto.destroy
    respond_to do |format|
      format.html { redirect_to personhavelifestateshavephotos_url, notice: "Personhavelifestateshavephoto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personhavelifestateshavephoto
      @personhavelifestateshavephoto = Personhavelifestateshavephoto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def personhavelifestateshavephoto_params
      params.require(:personhavelifestateshavephoto).permit(:personhavelifestate_id, :photo_id)
    end
end
