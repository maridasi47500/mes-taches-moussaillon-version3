class BarsController < ApplicationController
  before_action :set_bar, only: %i[ show edit update destroy ]
layout false, only: [:keys, :musicalinstruments]
  # GET /bars or /bars.json
  def keys
    @keys = Musicalkey.findbyid(params[:id])
  end
  def musicalinstruments
    @musicalinstruments = Musicalinstrument.findbyid(params[:id])
  end

  def index
    @bars = Bar.navigbars(params[:page])

  end

  # GET /bars/1 or /bars/1.json
  def show

  end

  # GET /bars/new
  def new
    @bar = Bar.new(musicalscore_id: params[:scoreid])
    @seeinstrument=session[:musicalins][@bar.musicalscore.id]['instr'] == '1' rescue nil
    @seekey=session[:musicalins][@bar.musicalscore.id]['keys'] == '1' rescue nil

  end

  # GET /bars/1/edit
  def edit
    @seeinstrument=session[:musicalins][@bar.musicalscore.id]['instr'] == '1' rescue nil
    @seekey=session[:musicalins][@bar.musicalscore.id]['keys'] == '1' rescue nil
  end

  # POST /bars or /bars.json
  def create
    @bar = Bar.new(bar_params)

    respond_to do |format|
      if @bar.save
        format.html { redirect_to @bar.musicalscore, notice: "Bar was successfully created." }
        format.json { render :show, status: :created, location: @bar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bars/1 or /bars/1.json
  def update
    respond_to do |format|
      if @bar.update(bar_params)
        format.html { redirect_to @bar.musicalscore, notice: "Bar was successfully updated." }
        format.json { render :show, status: :ok, location: @bar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bars/1 or /bars/1.json
  def destroy
    @bar.destroy
    respond_to do |format|
      format.html { redirect_to bars_url, notice: "Bar was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bar
      @bar = Bar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bar_params
      params.require(:bar).permit(:image,:musicalscore_id,:correctsample, :contentcorrectsample, :correct_id, :description, :nb,:correctsample=>{},:incorrectsample=>{},:correctsample=>[],:musicalinstrument_ids=>[], :musicalkey_ids=>[])
    end
end
