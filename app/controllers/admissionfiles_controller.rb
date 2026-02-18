class AdmissionfilesController < ApplicationController
  before_action :set_admissionfile, only: %i[ show edit update destroy ]

def json
@a=Admissionfile.findbyname(params[:name])
render json: @a
end

  # GET /admissionfiles or /admissionfiles.json
  def index
    @admissionfiles = Admissionfile.all
  end

  # GET /admissionfiles/1 or /admissionfiles/1.json
  def show
  end

  # GET /admissionfiles/new
  def new
    @admissionfile = Admissionfile.new
  end

  # GET /admissionfiles/1/edit
  def edit
  end

  # POST /admissionfiles or /admissionfiles.json
  def create
    @admissionfile = Admissionfile.new(admissionfile_params)

    respond_to do |format|
      if @admissionfile.save
        format.html { redirect_to @admissionfile, notice: "Admissionfile was successfully created." }
        format.json { render :show, status: :created, location: @admissionfile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admissionfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admissionfiles/1 or /admissionfiles/1.json
  def update
    respond_to do |format|
      if @admissionfile.update(admissionfile_params)
        format.html { redirect_to @admissionfile, notice: "Admissionfile was successfully updated." }
        format.json { render :show, status: :ok, location: @admissionfile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admissionfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admissionfiles/1 or /admissionfiles/1.json
  def destroy
    @admissionfile.destroy
    respond_to do |format|
      format.html { redirect_to admissionfiles_url, notice: "Admissionfile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admissionfile
      @admissionfile = Admissionfile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admissionfile_params
      params.require(:admissionfile).permit(:name)
    end
end
