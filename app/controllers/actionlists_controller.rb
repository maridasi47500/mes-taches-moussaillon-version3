class ActionlistsController < ApplicationController
  before_action :set_actionlist, only: %i[ show edit update destroy ]

  # GET /actionlists or /actionlists.json
  def index
    @actionlists = Actionlist.all
  end

  # GET /actionlists/1 or /actionlists/1.json
  def show
  end

  # GET /actionlists/new
  def new
    @actionlist = Actionlist.new
  end

  # GET /actionlists/1/edit
  def edit
  end

  # POST /actionlists or /actionlists.json
  def create
    @actionlist = Actionlist.new(actionlist_params)

    respond_to do |format|
      if @actionlist.save
        format.html { redirect_to @actionlist, notice: "Actionlist was successfully created." }
        format.json { render :show, status: :created, location: @actionlist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @actionlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actionlists/1 or /actionlists/1.json
  def update
    respond_to do |format|
      if @actionlist.update(actionlist_params)
        format.html { redirect_to @actionlist, notice: "Actionlist was successfully updated." }
        format.json { render :show, status: :ok, location: @actionlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @actionlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actionlists/1 or /actionlists/1.json
  def destroy
    @actionlist.destroy
    respond_to do |format|
      format.html { redirect_to actionlists_url, notice: "Actionlist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actionlist
      @actionlist = Actionlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def actionlist_params
      params.require(:actionlist).permit(:title_fr, :title_en, :title_de)
    end
end
