class LinkpeopleController < ApplicationController
  before_action :set_linkperson, only: %i[ show edit update destroy ]

  # GET /linkpeople or /linkpeople.json
  def index
    @linkpeople = Linkperson.all
  end

  # GET /linkpeople/1 or /linkpeople/1.json
  def show
  end

  # GET /linkpeople/new
  def new
    @linkperson = Linkperson.new
  end

  # GET /linkpeople/1/edit
  def edit
  end

  # POST /linkpeople or /linkpeople.json
  def create
    @linkperson = Linkperson.new(linkperson_params)

    respond_to do |format|
      if @linkperson.save
        format.html { redirect_to @linkperson, notice: "Linkperson was successfully created." }
        format.json { render :show, status: :created, location: @linkperson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @linkperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /linkpeople/1 or /linkpeople/1.json
  def update
    respond_to do |format|
      if @linkperson.update(linkperson_params)
        format.html { redirect_to @linkperson, notice: "Linkperson was successfully updated." }
        format.json { render :show, status: :ok, location: @linkperson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @linkperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /linkpeople/1 or /linkpeople/1.json
  def destroy
    @linkperson.destroy
    respond_to do |format|
      format.html { redirect_to linkpeople_url, notice: "Linkperson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_linkperson
      @linkperson = Linkperson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def linkperson_params
      params.require(:linkperson).permit(:name_en, :name_fr, :name_de)
    end
end
