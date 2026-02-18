class CreateWebpagesController < ApplicationController
  before_action :set_create_webpage, only: %i[ show edit update destroy ]

  # GET /create_webpages or /create_webpages.json
  def index
    @create_webpages = CreateWebpage.all
  end

  # GET /create_webpages/1 or /create_webpages/1.json
  def show
  end

  # GET /create_webpages/new
  def new
    @create_webpage = CreateWebpage.new
  end

  # GET /create_webpages/1/edit
  def edit
  end

  # POST /create_webpages or /create_webpages.json
  def create
    @create_webpage = CreateWebpage.new(create_webpage_params)

    respond_to do |format|
      if @create_webpage.save
        format.html { redirect_to @create_webpage, notice: "Create webpage was successfully created." }
        format.json { render :show, status: :created, location: @create_webpage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @create_webpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /create_webpages/1 or /create_webpages/1.json
  def update
    respond_to do |format|
      if @create_webpage.update(create_webpage_params)
        format.html { redirect_to @create_webpage, notice: "Create webpage was successfully updated." }
        format.json { render :show, status: :ok, location: @create_webpage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @create_webpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /create_webpages/1 or /create_webpages/1.json
  def destroy
    @create_webpage.destroy
    respond_to do |format|
      format.html { redirect_to create_webpages_url, notice: "Create webpage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_create_webpage
      @create_webpage = CreateWebpage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def create_webpage_params
      params.require(:create_webpage).permit(:title, :url)
    end
end
