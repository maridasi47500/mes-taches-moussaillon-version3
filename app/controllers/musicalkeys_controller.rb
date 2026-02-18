class MusicalkeysController < ApplicationController
  before_action :set_musicalkey, only: %i[ show edit update destroy ]

  # GET /musicalkeys or /musicalkeys.json
 def json
@t=Musicalkey.findbyname(params[:name])
render json: @t
 end
  def index
    @musicalkeys = Musicalkey.all
  end

  # GET /musicalkeys/1 or /musicalkeys/1.json
  def show
  end

  # GET /musicalkeys/new
  def new
    @musicalkey = Musicalkey.new
  end

  # GET /musicalkeys/1/edit
  def edit
  end

  # POST /musicalkeys or /musicalkeys.json
  def create
    @musicalkey = Musicalkey.new(musicalkey_params)

    respond_to do |format|
      if @musicalkey.save
        format.html { redirect_to @musicalkey, notice: "Musicalkey was successfully created." }
        format.json { render :show, status: :created, location: @musicalkey }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @musicalkey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /musicalkeys/1 or /musicalkeys/1.json
  def update
    respond_to do |format|
      if @musicalkey.update(musicalkey_params)
        format.html { redirect_to @musicalkey, notice: "Musicalkey was successfully updated." }
        format.json { render :show, status: :ok, location: @musicalkey }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @musicalkey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /musicalkeys/1 or /musicalkeys/1.json
  def destroy
    @musicalkey.destroy
    respond_to do |format|
      format.html { redirect_to musicalkeys_url, notice: "Musicalkey was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_musicalkey
      @musicalkey = Musicalkey.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def musicalkey_params
      params.require(:musicalkey).permit(:name_en, :name_fr, :name_de, :code_en,:code_fr,:code_de)
    end
end
