class IdolcommentsController < ApplicationController
  before_action :set_idolcomment, only: %i[ show edit update destroy ]
include JsonhelperHelper
layout false,only:[:user,:actor]
before_action :alltheactorsintvseries, only: [:jsonactor]
def jsonactor
 render json: Tvserieshaveactor.findbyname(params[:name])
end

def user
@person=Person.find(params[:id])
@alias=Alias.find_or_create_by(alias: @person,user: current_user)
@aliases=Alias.where(id: @alias.id)
end
def actor
@tvserieshaveactors=Tvserieshaveactor.findbyid(params[:id])
end

  # GET /idolcomments or /idolcomments.json
  def index
    @idolcomments = Idolcomment.all
  end

  # GET /idolcomments/1 or /idolcomments/1.json
  def show
  end

  # GET /idolcomments/new
  def new
    @idolcomment = Idolcomment.new
  end

  # GET /idolcomments/1/edit
  def edit
  end

  # POST /idolcomments or /idolcomments.json
  def create
    @idolcomment = Idolcomment.new(idolcomment_params)

    respond_to do |format|
      if @idolcomment.save
        format.html { redirect_to @idolcomment, notice: "Idolcomment was successfully created." }
        format.json { render :show, status: :created, location: @idolcomment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @idolcomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /idolcomments/1 or /idolcomments/1.json
  def update
    respond_to do |format|
      if @idolcomment.update(idolcomment_params)
        format.html { redirect_to @idolcomment, notice: "Idolcomment was successfully updated." }
        format.json { render :show, status: :ok, location: @idolcomment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @idolcomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /idolcomments/1 or /idolcomments/1.json
  def destroy
    @idolcomment.destroy
    respond_to do |format|
      format.html { redirect_to idolcomments_url, notice: "Idolcomment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idolcomment
      @idolcomment = Idolcomment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def idolcomment_params
      params.require(:idolcomment).permit(:tvserieshaveactor_id, :alias_id, :content_fr, :content_de, :content_en)
    end
end
