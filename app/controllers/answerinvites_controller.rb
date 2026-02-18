class AnswerinvitesController < ApplicationController
  before_action :set_answerinvite, only: %i[ show edit update destroy ]

  # GET /answerinvites or /answerinvites.json
  def index
    @answerinvites = Answerinvite.all
  end

  # GET /answerinvites/1 or /answerinvites/1.json
  def show
  end

  # GET /answerinvites/new
  def new
    @answerinvite = Answerinvite.new
  end

  # GET /answerinvites/1/edit
  def edit
  end

  # POST /answerinvites or /answerinvites.json
  def create
    @answerinvite = Answerinvite.new(answerinvite_params)

    respond_to do |format|
      if @answerinvite.save
        format.html { render @answerinvite, layout: false, notice: "Answerinvite was successfully created." }
        format.json { render :show, status: :created, location: @answerinvite }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @answerinvite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answerinvites/1 or /answerinvites/1.json
  def update
    respond_to do |format|
      if @answerinvite.update(answerinvite_params)
        format.html { redirect_to @answerinvite, notice: "Answerinvite was successfully updated." }
        format.json { render :show, status: :ok, location: @answerinvite }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @answerinvite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answerinvites/1 or /answerinvites/1.json
  def destroy
    @answerinvite.destroy
    respond_to do |format|
      format.html { redirect_to answerinvites_url, notice: "Answerinvite was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answerinvite
      @answerinvite = Answerinvite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answerinvite_params
      params.require(:answerinvite).permit(:person_id, :invite_id, :content)
    end
end
