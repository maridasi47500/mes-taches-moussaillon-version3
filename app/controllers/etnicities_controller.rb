class EtnicitiesController < ApplicationController
  before_action :set_etnicity, only: %i[ show edit update destroy ]

  # GET /etnicities or /etnicities.json
  def index
    @etnicities = Etnicity.all
  end

  # GET /etnicities/1 or /etnicities/1.json
  def show
  end

  # GET /etnicities/new
  def new
    @etnicity = Etnicity.new
  end

  # GET /etnicities/1/edit
  def edit
  end

  # POST /etnicities or /etnicities.json
  def create
    @etnicity = Etnicity.new(etnicity_params)

    respond_to do |format|
      if @etnicity.save
        format.html { redirect_to @etnicity, notice: "Etnicity was successfully created." }
        format.json { render :show, status: :created, location: @etnicity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @etnicity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /etnicities/1 or /etnicities/1.json
  def update
    respond_to do |format|
      if @etnicity.update(etnicity_params)
        format.html { redirect_to @etnicity, notice: "Etnicity was successfully updated." }
        format.json { render :show, status: :ok, location: @etnicity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @etnicity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /etnicities/1 or /etnicities/1.json
  def destroy
    @etnicity.destroy
    respond_to do |format|
      format.html { redirect_to etnicities_url, notice: "Etnicity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_etnicity
      @etnicity = Etnicity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def etnicity_params
      params.require(:etnicity).permit(:name, :image)
    end
end
