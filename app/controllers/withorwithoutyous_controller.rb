class WithorwithoutyousController < ApplicationController
  before_action :set_withorwithoutyou, only: %i[ show edit update destroy ]
include MyhelperHelper
before_action :allthepeople, only: [:withyous, :withoutyous]
layout false, only: [:withyous, :withoutyous]


  # GET /withorwithoutyous or /withorwithoutyous.json
def withyous
end
def withoutyous
end
  def index
    @withorwithoutyous = Withorwithoutyou.all
  end

  # GET /withorwithoutyous/1 or /withorwithoutyous/1.json
  def show
  end

  # GET /withorwithoutyous/new
  def new
    @withorwithoutyou = Withorwithoutyou.new
  end

  # GET /withorwithoutyous/1/edit
  def edit
  end

  # POST /withorwithoutyous or /withorwithoutyous.json
  def create
    @withorwithoutyou = Withorwithoutyou.new(withorwithoutyou_params)

    respond_to do |format|
      if @withorwithoutyou.save
        format.html { redirect_to @withorwithoutyou, notice: "Withorwithoutyou was successfully created." }
        format.json { render :show, status: :created, location: @withorwithoutyou }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @withorwithoutyou.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /withorwithoutyous/1 or /withorwithoutyous/1.json
  def update
    respond_to do |format|
      if @withorwithoutyou.update(withorwithoutyou_params)
        format.html { redirect_to @withorwithoutyou, notice: "Withorwithoutyou was successfully updated." }
        format.json { render :show, status: :ok, location: @withorwithoutyou }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @withorwithoutyou.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /withorwithoutyous/1 or /withorwithoutyous/1.json
  def destroy
    @withorwithoutyou.destroy
    respond_to do |format|
      format.html { redirect_to withorwithoutyous_url, notice: "Withorwithoutyou was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_withorwithoutyou
      @withorwithoutyou = Withorwithoutyou.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def withorwithoutyou_params
      params.fetch(:withorwithoutyou, {}).permit(:withthem_ids => [], :withoutthem_ids=>[])
    end
end
