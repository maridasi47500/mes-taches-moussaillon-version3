class ProposalvalidationsController < ApplicationController
  before_action :set_proposalvalidation, only: %i[ show edit update destroy ]

  # GET /proposalvalidations or /proposalvalidations.json
  def index
    @proposalvalidations = Proposalvalidation.all
  end

  # GET /proposalvalidations/1 or /proposalvalidations/1.json
  def show
  end

  # GET /proposalvalidations/new
  def new
    @proposalvalidation = Proposalvalidation.new
  end

  # GET /proposalvalidations/1/edit
  def edit
  end

  # POST /proposalvalidations or /proposalvalidations.json
  def create
    @proposalvalidation = Proposalvalidation.new(proposalvalidation_params)

    respond_to do |format|
      if @proposalvalidation.save
        format.html { redirect_to Post.joins(:votes).where("proposalvalidations.id" => @proposalvalidation).last, notice: "Proposalvalidation was successfully created." }
        format.json { render :show, status: :created, location: @proposalvalidation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @proposalvalidation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposalvalidations/1 or /proposalvalidations/1.json
  def update
    respond_to do |format|
      if @proposalvalidation.update(proposalvalidation_params)
        format.html { redirect_to Post.joins(:votes).where("proposalvalidations.id" => @proposalvalidation).last, notice: "Proposalvalidation was successfully updated." }
        format.json { render :show, status: :ok, location: @proposalvalidation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proposalvalidation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposalvalidations/1 or /proposalvalidations/1.json
  def destroy
    @proposalvalidation.destroy
    respond_to do |format|
      format.html { redirect_to proposalvalidations_url, notice: "Proposalvalidation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposalvalidation
      @proposalvalidation = Proposalvalidation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proposalvalidation_params
      params.require(:proposalvalidation).permit(:user_id, :proposal_id, :validated, :content_fr,:content_en,:content_de)
    end
end
