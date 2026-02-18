class GithubreposController < ApplicationController
  before_action :set_githubrepo, only: %i[ show edit update destroy ]
layout false, only: [:githubaccounts,:programminglanguages,:places]
  # GET /githubrepos or /githubrepos.json
def places
@places=Place.findbyid(params[:id])
end
def programminglanguages
@programminglanguages=Programminglanguage.findbyid(params[:id])
end

def json
@g=Githubrepo.findbyname(params[:name])
render json: @g
end
def githubaccounts
@githubaccounts=Githubaccount.findbyid(params[:id])
end
  def index
    @githubrepos = Githubrepo.all
  end

  # GET /githubrepos/1 or /githubrepos/1.json
  def show
  end

  # GET /githubrepos/new
  def new
    @githubrepo = Githubrepo.new
  end

  # GET /githubrepos/1/edit
  def edit
  end

  # POST /githubrepos or /githubrepos.json
  def create
    @githubrepo = Githubrepo.new(githubrepo_params)

    respond_to do |format|
      if @githubrepo.save
        format.html { redirect_to @githubrepo, notice: "Githubrepo was successfully created." }
        format.json { render :show, status: :created, location: @githubrepo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @githubrepo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /githubrepos/1 or /githubrepos/1.json
  def update
    respond_to do |format|
      if @githubrepo.update(githubrepo_params)
        format.html { redirect_to @githubrepo, notice: "Githubrepo was successfully updated." }
        format.json { render :show, status: :ok, location: @githubrepo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @githubrepo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /githubrepos/1 or /githubrepos/1.json
  def destroy
    @githubrepo.destroy
    respond_to do |format|
      format.html { redirect_to githubrepos_url, notice: "Githubrepo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_githubrepo
      @githubrepo = Githubrepo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def githubrepo_params
      params.require(:githubrepo).permit(:reponame, :githubaccount_id,:programminglanguage_ids=>[],:place_ids=>[])
    end
end
