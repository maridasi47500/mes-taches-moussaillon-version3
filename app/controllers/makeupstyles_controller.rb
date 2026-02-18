class MakeupstylesController < ApplicationController
  before_action :set_makeupstyle, only: %i[ show edit update destroy ]

  # GET /makeupstyles or /makeupstyles.json
  def index
    @makeupstyles = Makeupstyle.all
  end

  # GET /makeupstyles/1 or /makeupstyles/1.json
  def show
  end

  # GET /makeupstyles/new
  def new
    @makeupstyle = Makeupstyle.new
  end

  # GET /makeupstyles/1/edit
  def edit
  end

  # POST /makeupstyles or /makeupstyles.json
  def create
    @makeupstyle = Makeupstyle.new(makeupstyle_params)

    respond_to do |format|
      if @makeupstyle.save
        format.html { redirect_to @makeupstyle, notice: "Makeupstyle was successfully created." }
        format.json { render :show, status: :created, location: @makeupstyle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @makeupstyle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /makeupstyles/1 or /makeupstyles/1.json
  def update
    respond_to do |format|
      if @makeupstyle.update(makeupstyle_params)
        format.html { redirect_to @makeupstyle, notice: "Makeupstyle was successfully updated." }
        format.json { render :show, status: :ok, location: @makeupstyle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @makeupstyle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /makeupstyles/1 or /makeupstyles/1.json
  def destroy
    @makeupstyle.destroy
    respond_to do |format|
      format.html { redirect_to makeupstyles_url, notice: "Makeupstyle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_makeupstyle
      @makeupstyle = Makeupstyle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def makeupstyle_params
      params.require(:makeupstyle).permit(:name)
    end
end
