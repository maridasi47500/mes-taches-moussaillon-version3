class EndroitsController < ApplicationController
  before_action :set_endroit, only: %i[ show edit update destroy ]

  # GET /endroits or /endroits.json
  def index
    @endroits = Endroit.all
  end

  # GET /endroits/1 or /endroits/1.json
  def show
  end

  # GET /endroits/new
  def new
    @endroit = Endroit.new
  end

  # GET /endroits/1/edit
  def edit
  end

  # POST /endroits or /endroits.json
  def create
    @endroit = Endroit.new(endroit_params)

    respond_to do |format|
      if @endroit.save
        format.html { redirect_to @endroit, notice: "Endroit was successfully created." }
        format.json { render :show, status: :created, location: @endroit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @endroit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /endroits/1 or /endroits/1.json
  def update
    respond_to do |format|
      if @endroit.update(endroit_params)
        format.html { redirect_to @endroit, notice: "Endroit was successfully updated." }
        format.json { render :show, status: :ok, location: @endroit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @endroit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /endroits/1 or /endroits/1.json
  def destroy
    @endroit.destroy
    respond_to do |format|
      format.html { redirect_to endroits_url, notice: "Endroit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_endroit
      @endroit = Endroit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def endroit_params
      params.require(:endroit).permit(:name, :image)
    end
end
