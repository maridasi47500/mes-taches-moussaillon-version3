class GoogleresultsController < ApplicationController
  before_action :set_googleresult, only: %i[ show edit update destroy ]

  # GET /googleresults or /googleresults.json
  def index
    @googleresults = Googleresult.all
  end

  # GET /googleresults/1 or /googleresults/1.json
  def show
  end

  # GET /googleresults/new
  def new
    @googleresult = Googleresult.new
  end

  # GET /googleresults/1/edit
  def edit
  end

  # POST /googleresults or /googleresults.json
  def create
    @googleresult = Googleresult.new(googleresult_params)

    respond_to do |format|
      if @googleresult.save
        format.html { redirect_to @googleresult, notice: "Googleresult was successfully created." }
        format.json { render :show, status: :created, location: @googleresult }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @googleresult.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /googleresults/1 or /googleresults/1.json
  def update
    respond_to do |format|
      if @googleresult.update(googleresult_params)
        format.html { redirect_to @googleresult, notice: "Googleresult was successfully updated." }
        format.json { render :show, status: :ok, location: @googleresult }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @googleresult.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /googleresults/1 or /googleresults/1.json
  def destroy
    @googleresult.destroy
    respond_to do |format|
      format.html { redirect_to googleresults_url, notice: "Googleresult was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_googleresult
      @googleresult = Googleresult.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def googleresult_params
      params.require(:googleresult).permit(:content)
    end
end
