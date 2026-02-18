class RealfactsController < ApplicationController
  before_action :set_realfact, only: %i[ show edit update destroy ]

  # GET /realfacts or /realfacts.json
  def index
    @realfacts = Realfact.all
  end

  # GET /realfacts/1 or /realfacts/1.json
  def show
  end

  # GET /realfacts/new
  def new
    @realfact = Realfact.new
  end

  # GET /realfacts/1/edit
  def edit
  end

  # POST /realfacts or /realfacts.json
  def create
    @realfact = Realfact.new(realfact_params)

    respond_to do |format|
      if @realfact.save
        format.html { redirect_to @realfact, notice: "Realfact was successfully created." }
        format.json { render :show, status: :created, location: @realfact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @realfact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /realfacts/1 or /realfacts/1.json
  def update
    respond_to do |format|
      if @realfact.update(realfact_params)
        format.html { redirect_to @realfact, notice: "Realfact was successfully updated." }
        format.json { render :show, status: :ok, location: @realfact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @realfact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /realfacts/1 or /realfacts/1.json
  def destroy
    @realfact.destroy
    respond_to do |format|
      format.html { redirect_to realfacts_url, notice: "Realfact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_realfact
      @realfact = Realfact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def realfact_params
      params.require(:realfact).permit(:content_fr, :content_en, :content_de)
    end
end
