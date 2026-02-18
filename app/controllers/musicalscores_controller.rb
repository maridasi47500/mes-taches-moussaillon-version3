class MusicalscoresController < ApplicationController
  before_action :set_musicalscore, only: %i[ show edit update destroy addbar ]

layout false, only: [:musicalinstrument,:keys]
  # GET /musicalscores or /musicalscores.json
  def json
    @musicalscores = Musicalscore.findbyname(params[:name])
    render json: @musicalscores
  end
  def addbar
    params[:nb].to_i.times do 
      @musicalscore.bars.new
    end
 render :addbar
   
  end
  def keys
    @keys = Musicalkey.findbyid(params[:id])
  end
  def musicalinstrument
    @musicalinstruments = Musicalinstrument.findbyid(params[:id])
  end
  def index
    @musicalscores = Musicalscore.navigscores(params[:page])
  end
  def myscores
    @task=Task.find(params[:taskid])
    @things = @task.things.group_by{|x|x.type}.to_a
    render layout: false
  end

  # GET /musicalscores/1 or /musicalscores/1.json
  def show
  end

  # GET /musicalscores/new
  def new
    @musicalscore = Musicalscore.new
  end

  # GET /musicalscores/1/edit
  def edit
    @seeinstrument=session[:musicalins][@musicalscore.id]['instr'] == '1' rescue false
    @seekey=session[:musicalins][@musicalscore.id]['keys'] == '1' rescue false
    @musicalscore.seemyinstrument=@seeinstrument
    @musicalscore.seethekeys=@seekey

  end

  # POST /musicalscores or /musicalscores.json
  def create
    @musicalscore = Musicalscore.new(musicalscore_params)

    respond_to do |format|
      if @musicalscore.save
          session[:musicalins]||={}
          session[:musicalins][@musicalscore.id]||={}
          session[:musicalins][@musicalscore.id]['instr']=@musicalscore.seemyinstrument
          session[:musicalins][@musicalscore.id]['keys']=@musicalscore.seethekeys
        format.html { redirect_to @musicalscore, notice: "Musicalscore was successfully created." }
        format.json { render :show, status: :created, location: @musicalscore }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @musicalscore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /musicalscores/1 or /musicalscores/1.json
  def update
    respond_to do |format|
      if @musicalscore.update(musicalscore_params)
          session[:musicalins]||={}
          session[:musicalins][@musicalscore.id]||={}
          session[:musicalins][@musicalscore.id]['instr']=@musicalscore.seemyinstrument
          session[:musicalins][@musicalscore.id]['keys']=@musicalscore.seethekeys
        format.html { redirect_to @musicalscore, notice: "Musicalscore was successfully updated." }
        format.json { render :show, status: :ok, location: @musicalscore }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @musicalscore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /musicalscores/1 or /musicalscores/1.json
  def destroy
    @musicalscore.destroy
    respond_to do |format|
      format.html { redirect_to musicalscores_url, notice: "Musicalscore was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_musicalscore
      @musicalscore = Musicalscore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def musicalscore_params
      params.require(:musicalscore).permit(:seethekeys,:seemyinstrument,:musicalinstrument_id,:name, :image, :description,:bars_attributes=>{},:bar_ids=>[],:musicalinstrument_ids=>[], :musicalkey_ids=>[])
    end
end
