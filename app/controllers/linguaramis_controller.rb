class LinguaramisController < ApplicationController
  before_action :set_linguarami, only: %i[ show edit update destroy ]
layout false, only: [:phrases]
  # GET /linguaramis or /linguaramis.json
def phrases
@phrases=Phrase.findbyid(params[:id])
end
  def index
    @linguaramis = Linguarami.all
  end

  # GET /linguaramis/1 or /linguaramis/1.json
  def show
  end

  # GET /linguaramis/new
  def new
    @linguarami = Linguarami.new
  end

  # GET /linguaramis/1/edit
  def edit
  end

  # POST /linguaramis or /linguaramis.json
  def create
    @linguarami = Linguarami.new(linguarami_params)

    respond_to do |format|
      if @linguarami.save
        format.html { redirect_to @linguarami, notice: "Linguarami was successfully created." }
        format.json { render :show, status: :created, location: @linguarami }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @linguarami.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /linguaramis/1 or /linguaramis/1.json
  def update
    respond_to do |format|
      if @linguarami.update(linguarami_params)
        format.html { redirect_to @linguarami, notice: "Linguarami was successfully updated." }
        format.json { render :show, status: :ok, location: @linguarami }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @linguarami.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /linguaramis/1 or /linguaramis/1.json
  def destroy
    @linguarami.destroy
    respond_to do |format|
      format.html { redirect_to linguaramis_url, notice: "Linguarami was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_linguarami
      @linguarami = Linguarami.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def linguarami_params
      params.fetch(:linguarami, {}).permit(:user_id,:phrase_ids=>[])
    end
end
