class MetonymiesController < ApplicationController
  before_action :set_metonymy, only: [:show, :edit, :update, :destroy]

  # GET /metonymies
  # GET /metonymies.json
  def index
    @metonymies = Metonymy.all
  end

  # GET /metonymies/1
  # GET /metonymies/1.json
  def show
  end

  # GET /metonymies/new
  def new
    @metonymy = Metonymy.new
  end

  # GET /metonymies/1/edit
  def edit
  end

  # POST /metonymies
  # POST /metonymies.json
  def create
    @metonymy = Metonymy.new(metonymy_params)

    respond_to do |format|
      if @metonymy.save
        format.html { redirect_to @metonymy, notice: 'Metonymy was successfully created.' }
        format.json { render :show, status: :created, location: @metonymy }
      else
        format.html { render :new }
        format.json { render json: @metonymy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /metonymies/1
  # PATCH/PUT /metonymies/1.json
  def update
    respond_to do |format|
      if @metonymy.update(metonymy_params)
        format.html { redirect_to @metonymy, notice: 'Metonymy was successfully updated.' }
        format.json { render :show, status: :ok, location: @metonymy }
      else
        format.html { render :edit }
        format.json { render json: @metonymy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metonymies/1
  # DELETE /metonymies/1.json
  def destroy
    @metonymy.destroy
    respond_to do |format|
      format.html { redirect_to metonymies_url, notice: 'Metonymy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metonymy
      @metonymy = Metonymy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def metonymy_params
      params.require(:metonymy).permit(:thing_id, :name, :post_id)
    end
end
