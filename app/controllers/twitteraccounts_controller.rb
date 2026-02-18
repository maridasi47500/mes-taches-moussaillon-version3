class TwitteraccountsController < ApplicationController
  before_action :set_twitteraccount, only: %i[ show edit update destroy ]
  include MyhelperHelper
  before_action :allthetwitteraccounts, only: %i[ twitteraccounts ]
  layout false, only: %i[ twitteraccounts ]
  def twitteraccounts
  end

  def searchintweets
    @t=Twitteraccount.searchintweets(params[:q])
    render json: @t
  end
  def json
    @twitteraccounts = Twitteraccount.findbyname(params[:name])
    render json: @twitteraccounts
  end


  # GET /twitteraccounts or /twitteraccounts.json
  def searchtweets
  end
  def index
    @twitteraccounts = Twitteraccount.all
  end

  # GET /twitteraccounts/1 or /twitteraccounts/1.json
  def show
  end

  # GET /twitteraccounts/new
  def new
    @twitteraccount = Twitteraccount.new
  end

  # GET /twitteraccounts/1/edit
  def edit
  end

  # POST /twitteraccounts or /twitteraccounts.json
  def create
    @twitteraccount = Twitteraccount.new(twitteraccount_params)

    respond_to do |format|
      if @twitteraccount.save
        format.html { redirect_to @twitteraccount, notice: "Twitteraccount was successfully created." }
        format.json { render :show, status: :created, location: @twitteraccount }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @twitteraccount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twitteraccounts/1 or /twitteraccounts/1.json
  def update
    respond_to do |format|
      if @twitteraccount.update(twitteraccount_params)
        format.html { redirect_to @twitteraccount, notice: "Twitteraccount was successfully updated." }
        format.json { render :show, status: :ok, location: @twitteraccount }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @twitteraccount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twitteraccounts/1 or /twitteraccounts/1.json
  def destroy
    @twitteraccount.destroy
    respond_to do |format|
      format.html { redirect_to twitteraccounts_url, notice: "Twitteraccount was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twitteraccount
      @twitteraccount = Twitteraccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def twitteraccount_params
      params.require(:twitteraccount).permit(:name, :username,:twitteraccount_ids=>[])
    end
end
