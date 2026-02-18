class AnaphorsController < ApplicationController
  before_action :set_anaphor, only: [:show, :edit, :update, :destroy]

  # GET /anaphors
  # GET /anaphors.json
  def index
    @anaphors = Anaphor.all
  end

  # GET /anaphors/1
  # GET /anaphors/1.json
  def show
  end

  # GET /anaphors/new
  def new
    @anaphor = Anaphor.new
  end

  # GET /anaphors/1/edit
  def edit
  end

  # POST /anaphors
  # POST /anaphors.json
  def create
    @anaphor = Anaphor.new(anaphor_params)

    respond_to do |format|
      if @anaphor.save
        format.html { redirect_to @anaphor, notice: 'Anaphor was successfully created.' }
        format.json { render :show, status: :created, location: @anaphor }
      else
        format.html { render :new }
        format.json { render json: @anaphor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anaphors/1
  # PATCH/PUT /anaphors/1.json
  def update
    respond_to do |format|
      if @anaphor.update(anaphor_params)
        format.html { redirect_to @anaphor, notice: 'Anaphor was successfully updated.' }
        format.json { render :show, status: :ok, location: @anaphor }
      else
        format.html { render :edit }
        format.json { render json: @anaphor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anaphors/1
  # DELETE /anaphors/1.json
  def destroy
    @anaphor.destroy
    respond_to do |format|
      format.html { redirect_to anaphors_url, notice: 'Anaphor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anaphor
      @anaphor = Anaphor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def anaphor_params
      params.fetch(:anaphor, {}).permit(:content_en,:content_fr,:content_de,:photos_attributes=>{})
    end
end
