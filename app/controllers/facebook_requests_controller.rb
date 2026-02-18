class FacebookRequestsController < ApplicationController
  before_action :set_facebook_request, only: %i[ show edit update destroy ]

  # GET /facebook_requests or /facebook_requests.json
  def index
    @facebook_requests = FacebookRequest.all
  end

  # GET /facebook_requests/1 or /facebook_requests/1.json
  def show
  end

  # GET /facebook_requests/new
  def new
    @facebook_request = FacebookRequest.new
  end

  # GET /facebook_requests/1/edit
  def edit
  end

  # POST /facebook_requests or /facebook_requests.json
  def create
    @facebook_request = FacebookRequest.new(facebook_request_params)

    respond_to do |format|
      if @facebook_request.save
        format.html { redirect_to @facebook_request, notice: "Facebook request was successfully created." }
        format.json { render :show, status: :created, location: @facebook_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @facebook_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facebook_requests/1 or /facebook_requests/1.json
  def update
    respond_to do |format|
      if @facebook_request.update(facebook_request_params)
        format.html { redirect_to @facebook_request, notice: "Facebook request was successfully updated." }
        format.json { render :show, status: :ok, location: @facebook_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @facebook_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facebook_requests/1 or /facebook_requests/1.json
  def destroy
    @facebook_request.destroy
    respond_to do |format|
      format.html { redirect_to facebook_requests_url, notice: "Facebook request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facebook_request
      @facebook_request = FacebookRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def facebook_request_params
      params.require(:facebook_request).permit(:name)
    end
end
