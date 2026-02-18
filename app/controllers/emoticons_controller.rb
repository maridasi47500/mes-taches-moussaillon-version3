class EmoticonsController < ApplicationController
  before_action :set_emoticon, only: %i[ show edit update destroy ]

  # GET /emoticons or /emoticons.json
  def json
    
    @emoticons = Emoticon.findbyname(params[:name])
    render json: @emoticons
  end
  def index
    @emoticons = Emoticon.all
  end

  # GET /emoticons/1 or /emoticons/1.json
  def show
  end

  # GET /emoticons/new
  def new
    @emoticon = Emoticon.new
  end

  # GET /emoticons/1/edit
  def edit
  end

  # POST /emoticons or /emoticons.json
  def create
    @emoticon = Emoticon.new(emoticon_params)

    respond_to do |format|
      if @emoticon.save
        format.html { redirect_to @emoticon, notice: "Emoticon was successfully created." }
        format.json { render :show, status: :created, location: @emoticon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @emoticon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emoticons/1 or /emoticons/1.json
  def update
    respond_to do |format|
      if @emoticon.update(emoticon_params)
        format.html { redirect_to @emoticon, notice: "Emoticon was successfully updated." }
        format.json { render :show, status: :ok, location: @emoticon }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @emoticon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emoticons/1 or /emoticons/1.json
  def destroy
    @emoticon.destroy
    respond_to do |format|
      format.html { redirect_to emoticons_url, notice: "Emoticon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emoticon
      @emoticon = Emoticon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def emoticon_params
      params.require(:emoticon).permit(:image, :title)
    end
end
