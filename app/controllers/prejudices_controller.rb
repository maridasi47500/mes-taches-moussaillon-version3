class PrejudicesController < ApplicationController
  before_action :set_prejudice, only: %i[ show edit update destroy ]

  # GET /prejudices or /prejudices.json
  def index
    @prejudices = Prejudice.all
  end

  # GET /prejudices/1 or /prejudices/1.json
  def show
  end

  # GET /prejudices/new
  def new
    @prejudice = Prejudice.new
  end

  # GET /prejudices/1/edit
  def edit
  end

  # POST /prejudices or /prejudices.json
  def create
    @prejudice = Prejudice.new(prejudice_params)

    respond_to do |format|
      if @prejudice.save
        format.html { redirect_to @prejudice, notice: "Prejudice was successfully created." }
        format.json { render :show, status: :created, location: @prejudice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prejudice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prejudices/1 or /prejudices/1.json
  def update
    respond_to do |format|
      if @prejudice.update(prejudice_params)
        format.html { redirect_to @prejudice, notice: "Prejudice was successfully updated." }
        format.json { render :show, status: :ok, location: @prejudice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prejudice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prejudices/1 or /prejudices/1.json
  def destroy
    @prejudice.destroy
    respond_to do |format|
      format.html { redirect_to prejudices_url, notice: "Prejudice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prejudice
      @prejudice = Prejudice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prejudice_params
      params.require(:prejudice).permit(:content_en, :content_fr, :content_de)
    end
end
