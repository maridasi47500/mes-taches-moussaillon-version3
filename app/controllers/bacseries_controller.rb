class BacseriesController < ApplicationController
  before_action :set_bacseries, only: %i[ show edit update destroy ]

def json
@a=Bacseries.findbyname(params[:name])
render json: @a
end
  # GET /bacseries or /bacseries.json
  def index
    @bacseries = Bacseries.all
  end

  # GET /bacseries/1 or /bacseries/1.json
  def show
  end

  # GET /bacseries/new
  def new
    @bacseries = Bacseries.new
  end

  # GET /bacseries/1/edit
  def edit
  end

  # POST /bacseries or /bacseries.json
  def create
    @bacseries = Bacseries.new(bacseries_params)

    respond_to do |format|
      if @bacseries.save
        format.html { redirect_to @bacseries, notice: "Bacserie was successfully created." }
        format.json { render :show, status: :created, location: @bacseries }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bacseries.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bacseries/1 or /bacseries/1.json
  def update
    respond_to do |format|
      if @bacseries.update(bacseries_params)
        format.html { redirect_to @bacseries, notice: "Bacserie was successfully updated." }
        format.json { render :show, status: :ok, location: @bacseries }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bacseries.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bacseries/1 or /bacseries/1.json
  def destroy
    @bacseries.destroy
    respond_to do |format|
      format.html { redirect_to bacseries_url, notice: "Bacserie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bacseries
      @bacseries = Bacseries.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bacseries_params
      params.require(:bacseries).permit(:name)
    end
end
