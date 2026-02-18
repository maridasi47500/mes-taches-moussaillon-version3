class MylayoutsController < ApplicationController
  before_action :set_mylayout, only: %i[ show edit update destroy ]

  # GET /mylayouts or /mylayouts.json
  def index
    @mylayouts = Mylayout.all
  end

  # GET /mylayouts/1 or /mylayouts/1.json
  def show
  end

  # GET /mylayouts/new
  def new
    @mylayout = Mylayout.new
  end

  # GET /mylayouts/1/edit
  def edit
  end

  # POST /mylayouts or /mylayouts.json
  def create
    @mylayout = Mylayout.new(mylayout_params)

    respond_to do |format|
      if @mylayout.save
        format.html { redirect_to @mylayout, notice: "Mylayout was successfully created." }
        format.json { render :show, status: :created, location: @mylayout }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mylayout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mylayouts/1 or /mylayouts/1.json
  def update
    respond_to do |format|
      if @mylayout.update(mylayout_params)
        format.html { redirect_to @mylayout, notice: "Mylayout was successfully updated." }
        format.json { render :show, status: :ok, location: @mylayout }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mylayout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mylayouts/1 or /mylayouts/1.json
  def destroy
    @mylayout.destroy
    respond_to do |format|
      format.html { redirect_to mylayouts_url, notice: "Mylayout was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mylayout
      @mylayout = Mylayout.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mylayout_params
      params.require(:mylayout).permit(:name, :title, :typelayout)
    end
end
