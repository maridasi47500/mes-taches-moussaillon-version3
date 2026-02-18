class GoogleRequestsController < ApplicationController
  before_action :set_google_request, only: %i[ show edit update destroy ]

  # GET /google_requests or /google_requests.json
  def index
    @google_requests = GoogleRequest.all
  end

  # GET /google_requests/1 or /google_requests/1.json
  def show
  end

  # GET /google_requests/new
  def new
    @google_request = GoogleRequest.new
  end

  # GET /google_requests/1/edit
  def edit
  end

  # POST /google_requests or /google_requests.json
  def create
    @google_request = GoogleRequest.new(google_request_params)

    respond_to do |format|
      if @google_request.save
        format.html { redirect_to @google_request, notice: "Google request was successfully created." }
        format.json { render :show, status: :created, location: @google_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @google_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /google_requests/1 or /google_requests/1.json
  def update
    respond_to do |format|
      if @google_request.update(google_request_params)
        format.html { redirect_to @google_request, notice: "Google request was successfully updated." }
        format.json { render :show, status: :ok, location: @google_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @google_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /google_requests/1 or /google_requests/1.json
  def destroy
    @google_request.destroy
    respond_to do |format|
      format.html { redirect_to google_requests_url, notice: "Google request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_google_request
      @google_request = GoogleRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def google_request_params
      params.require(:google_request).permit(:name)
    end
end
