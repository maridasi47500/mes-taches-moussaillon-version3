class FilmsController < ApplicationController
  before_action :set_film, only: %i[ show edit update destroy editroles]
layout false, only: [:actors,:places,:epochs]
  include MyhelperHelper
  before_action :alltheepochs, only: %i[ epochs ]
  def epochs
  end

def places
@places=Place.findbyid(params[:id])
end

  def json
@films=Film.findbyname(params[:name])
render json: @films
  end
  def actors
@people=Person.findbyid(params[:id])
  end

  def editroles
  end
  # GET /films or /films.json
  def index
    @films = Film.all
  end

  # GET /films/1 or /films/1.json
  def show
  end

  # GET /films/new
  def new
    @film = Film.new
  end

  # GET /films/1/edit
  def edit
  end

  # POST /films or /films.json
  def create
    @film = Film.new(film_params)

    respond_to do |format|
      if @film.save
        format.html { redirect_to @film, notice: "Film was successfully created." }
        format.json { render :show, status: :created, location: @film }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /films/1 or /films/1.json
  def update
    respond_to do |format|
      if @film.update(film_params)
        format.html { redirect_to @film, notice: "Film was successfully updated." }
        format.json { render :show, status: :ok, location: @film }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /films/1 or /films/1.json
  def destroy
    @film.destroy
    respond_to do |format|
      format.html { redirect_to films_url, notice: "Film was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_film
      @film = Film.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def film_params
      params.require(:film).permit(:title, :description, :image,:place_ids=>[],:actor_ids=>[],:epoch_ids=>[],:phavefilms_attributes=>{})
    end
end
