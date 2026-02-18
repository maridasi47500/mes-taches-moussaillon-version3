class AregoodrequestsController < ApplicationController
  before_action :set_aregoodrequest, only: %i[ show edit update destroy ]

  # GET /aregoodrequests or /aregoodrequests.json
  def index
    @aregoodrequests = Aregoodrequest.all
  end

  # GET /aregoodrequests/1 or /aregoodrequests/1.json
  def show
params[:alias_id]=@aregoodrequest.alias_id
params[:emoticon_id]=@aregoodrequest.emoticon_id
params[:requeststopersonhaverequestperson_id]=@aregoodrequest.requeststopersonhaverequestperson_id
  end

  # GET /aregoodrequests/new
  def new
    @aregoodrequest = Aregoodrequest.new
  end

  # GET /aregoodrequests/1/edit
  def edit
  end

  # POST /aregoodrequests or /aregoodrequests.json
  def create
    @aregoodrequest = Aregoodrequest.new(aregoodrequest_params)

    respond_to do |format|
      if @aregoodrequest.save
        format.html { redirect_to @aregoodrequest, notice: "Aregoodrequest was successfully created." }
        format.json { render :show, status: :created, location: @aregoodrequest }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @aregoodrequest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aregoodrequests/1 or /aregoodrequests/1.json
  def update
    respond_to do |format|
      if @aregoodrequest.update(aregoodrequest_params)
        format.html { redirect_to @aregoodrequest, notice: "Aregoodrequest was successfully updated." }
        format.json { render :show, status: :ok, location: @aregoodrequest }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @aregoodrequest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aregoodrequests/1 or /aregoodrequests/1.json
  def destroy
    @aregoodrequest.destroy
    respond_to do |format|
      format.html { redirect_to aregoodrequests_url, notice: "Aregoodrequest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aregoodrequest
      @aregoodrequest = Aregoodrequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def aregoodrequest_params
      params.fetch(:aregoodrequest, {})
    end
end
