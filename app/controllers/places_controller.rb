class PlacesController < ApplicationController
  before_action :set_place, only: [:mysurname,:show, :edit, :update, :destroy]

  # GET /places
  # GET /places.json
def mysurname
end
  def json
    @places = Place.findbyname(params[:name])
    render json: @places
  end
  def index
    @places = Place.bypage(params[:page].to_i)
  end

  # GET /places/1
  # GET /places/1.json
  def show
    if params[:ajax]
        render @profilepicture, layout: false
end

  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if params[:ajax] and @place.update(place_params)
        format.html { render @place.my_posts_surnames.order(id: :desc).take(1), layout: false, notice: "Place was successfully created." }
        format.json { render :show, status: :created, location: @profilepicture }
      elsif @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.fetch(:post, {}).permit(:end_at, :start_at,:name, :image,:latitude, :longitude ,:city_id, :place_id, :state_id, :address,:my_posts_surnames_attributes=>{})
    end
    def place_params
      params.fetch(:place, {}).permit(:end_at,:country_id, :start_at,:name, :image,:latitude, :longitude ,:city_id, :place_id, :state_id, :address,:my_posts_surnames_attributes=>{})
    end
end
