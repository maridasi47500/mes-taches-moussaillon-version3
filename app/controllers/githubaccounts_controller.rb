class GithubaccountsController < ApplicationController
  before_action :set_githubaccount, only: %i[ show edit update destroy ]
layout false, only: [:person]
def json
    @g = Githubaccount.findbyname(params[:name])
    render json: @g
end
def person
@people=Person.findbyid(params[:id])
end
  # GET /githubaccounts or /githubaccounts.json
  def index
    @githubaccounts = Githubaccount.all
  end

  # GET /githubaccounts/1 or /githubaccounts/1.json
  def show
  end

  # GET /githubaccounts/new
  def new
    @githubaccount = Githubaccount.new
  end

  # GET /githubaccounts/1/edit
  def edit
  end

  # POST /githubaccounts or /githubaccounts.json
  def create
    @githubaccount = Githubaccount.new(githubaccount_params)

    respond_to do |format|
      if @githubaccount.save
        format.html { redirect_to @githubaccount, notice: "Githubaccount was successfully created." }
        format.json { render :show, status: :created, location: @githubaccount }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @githubaccount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /githubaccounts/1 or /githubaccounts/1.json
  def update
    respond_to do |format|
      if @githubaccount.update(githubaccount_params)
        format.html { redirect_to @githubaccount, notice: "Githubaccount was successfully updated." }
        format.json { render :show, status: :ok, location: @githubaccount }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @githubaccount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /githubaccounts/1 or /githubaccounts/1.json
  def destroy
    @githubaccount.destroy
    respond_to do |format|
      format.html { redirect_to githubaccounts_url, notice: "Githubaccount was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_githubaccount
      @githubaccount = Githubaccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def githubaccount_params
      params.require(:githubaccount).permit(:username, :nameowner, :owner_id)
    end
end
