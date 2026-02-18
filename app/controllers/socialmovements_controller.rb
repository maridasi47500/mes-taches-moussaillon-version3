class SocialmovementsController < ApplicationController
  before_action :set_socialmovement, only: %i[ show edit update destroy ]

def json
@s=Socialmovement.findbyname(params[:name])
render json: @s
end
  # GET /socialmovements or /socialmovements.json
  def index
    @socialmovements = Socialmovement.all
  end

  # GET /socialmovements/1 or /socialmovements/1.json
  def show
  end

  # GET /socialmovements/new
  def new
    @socialmovement = Socialmovement.new
  end

  # GET /socialmovements/1/edit
  def edit
  end

  # POST /socialmovements or /socialmovements.json
  def create
    @socialmovement = Socialmovement.new(socialmovement_params)

    respond_to do |format|
      if @socialmovement.save
        format.html { redirect_to @socialmovement, notice: "Socialmovement was successfully created." }
        format.json { render :show, status: :created, location: @socialmovement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @socialmovement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /socialmovements/1 or /socialmovements/1.json
  def update
    respond_to do |format|
      if @socialmovement.update(socialmovement_params)
        format.html { redirect_to @socialmovement, notice: "Socialmovement was successfully updated." }
        format.json { render :show, status: :ok, location: @socialmovement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @socialmovement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /socialmovements/1 or /socialmovements/1.json
  def destroy
    @socialmovement.destroy
    respond_to do |format|
      format.html { redirect_to socialmovements_url, notice: "Socialmovement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socialmovement
      @socialmovement = Socialmovement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def socialmovement_params
      params.require(:socialmovement).permit(:name, :image)
    end
end
