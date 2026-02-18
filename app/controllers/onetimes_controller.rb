class OnetimesController < ApplicationController
  before_action :set_onetime, only: [:show, :edit, :update, :destroy]

  # GET /onetimes
  # GET /onetimes.json
  def index
    @onetimes = Onetime.all
  end

  # GET /onetimes/1
  # GET /onetimes/1.json
  def show
  end

  # GET /onetimes/new
  def new
    @onetime = Onetime.new
  end

  # GET /onetimes/1/edit
  def edit
  end

  # POST /onetimes
  # POST /onetimes.json
  def create
    @onetime = Onetime.new(onetime_params)

    respond_to do |format|
      if @onetime.save
        format.html { redirect_to @onetime, notice: 'Onetime was successfully created.' }
        format.json { render :show, status: :created, location: @onetime }
      else
        format.html { render :new }
        format.json { render json: @onetime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /onetimes/1
  # PATCH/PUT /onetimes/1.json
  def update
    respond_to do |format|
      if @onetime.update(onetime_params)
        format.html { redirect_to @onetime, notice: 'Onetime was successfully updated.' }
        format.json { render :show, status: :ok, location: @onetime }
      else
        format.html { render :edit }
        format.json { render json: @onetime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /onetimes/1
  # DELETE /onetimes/1.json
  def destroy
    @onetime.destroy
    respond_to do |format|
      format.html { redirect_to onetimes_url, notice: 'Onetime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_onetime
      @onetime = Onetime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def onetime_params
      params.require(:onetime).permit(:pronoun_id, :content)
    end
end
