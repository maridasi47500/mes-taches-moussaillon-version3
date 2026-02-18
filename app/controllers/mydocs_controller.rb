class MydocsController < ApplicationController
  before_action :set_mydoc, only: %i[ show edit update destroy ]

  # GET /mydocs or /mydocs.json
  def index
    @mydocs = Mydoc.all
  end

  # GET /mydocs/1 or /mydocs/1.json
  def show
  end

  # GET /mydocs/new
  def new
    @mydoc = Mydoc.new
  end

  # GET /mydocs/1/edit
  def edit
  end

  # POST /mydocs or /mydocs.json
  def create
    @mydoc = Mydoc.new(mydoc_params)

    respond_to do |format|
      if @mydoc.save
        format.html { redirect_to @mydoc, notice: "Mydoc was successfully created." }
        format.json { render :show, status: :created, location: @mydoc }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mydoc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mydocs/1 or /mydocs/1.json
  def update
    respond_to do |format|
      if @mydoc.update(mydoc_params)
        format.html { redirect_to @mydoc, notice: "Mydoc was successfully updated." }
        format.json { render :show, status: :ok, location: @mydoc }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mydoc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mydocs/1 or /mydocs/1.json
  def destroy
    @mydoc.destroy
    respond_to do |format|
      format.html { redirect_to mydocs_url, notice: "Mydoc was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mydoc
      @mydoc = Mydoc.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mydoc_params
      params.require(:mydoc).permit(:controller, :action, :content, :user_id)
    end
end
