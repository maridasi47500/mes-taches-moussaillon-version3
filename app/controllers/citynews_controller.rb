class CitynewsController < ApplicationController
  before_action :set_citynews, only: %i[ show edit update destroy ]
 def city
        @cities=City.findbyid(params[:id])
        render layout: false
  end


  # GET /citynews or /citynews.json
  def index
    @citynews = Citynews.all
  end

  # GET /citynews/1 or /citynews/1.json
  def show
  end

  # GET /citynews/new
  def new
    @citynews = Citynews.new(user_id:current_user.id)
  end

  # GET /citynews/1/edit
  def edit
  end

  # POST /citynews or /citynews.json
  def create
    @citynews = Citynews.new(citynews_params)

    respond_to do |format|
      if @citynews.save
        format.html { redirect_to @citynews, notice: "Citynews was successfully created." }
        format.json { render :show, status: :created, location: @citynews }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @citynews.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citynews/1 or /citynews/1.json
  def update
    respond_to do |format|
      if @citynews.update(citynews_params)
        format.html { redirect_to @citynews, notice: "Citynews was successfully updated." }
        format.json { render :show, status: :ok, location: @citynews }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @citynews.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citynews/1 or /citynews/1.json
  def destroy
    @citynews.destroy
    respond_to do |format|
      format.html { redirect_to citynews_index_url, notice: "Citynews was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_citynews
      @citynews = Citynews.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def citynews_params
      params.require(:citynews).permit(:user_id,:city_id,:content)

    end
end
