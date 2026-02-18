class FrontpagesController < ApplicationController
  before_action :set_frontpage, only: %i[ show edit update destroy ]
include MyhelperHelper


before_action :allthepeople, only: [:people]
layout false, only: [:people]


  # GET /withorwithoutyous or /withorwithoutyous.json
def people
end

  # GET /frontpages or /frontpages.json
  def index
    @frontpages = Frontpage.all
  end

  # GET /frontpages/1 or /frontpages/1.json
  def show
  end

  # GET /frontpages/new
  def new
    @frontpage = Frontpage.new
  end

  # GET /frontpages/1/edit
  def edit
  end

  # POST /frontpages or /frontpages.json
  def create
    @frontpage = Frontpage.new(frontpage_params)

    respond_to do |format|
      if @frontpage.save
        format.html { redirect_to @frontpage, notice: "Frontpage was successfully created." }
        format.json { render :show, status: :created, location: @frontpage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @frontpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /frontpages/1 or /frontpages/1.json
  def update
    respond_to do |format|
      if @frontpage.update(frontpage_params)
        format.html { redirect_to @frontpage, notice: "Frontpage was successfully updated." }
        format.json { render :show, status: :ok, location: @frontpage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @frontpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frontpages/1 or /frontpages/1.json
  def destroy
    @frontpage.destroy
    respond_to do |format|
      format.html { redirect_to frontpages_url, notice: "Frontpage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frontpage
      @frontpage = Frontpage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def frontpage_params
      params.fetch(:frontpage, {}).permit(:person_ids=>[])
    end
end
