class FactoriesController < ApplicationController
  before_action :set_factory, only: %i[ show edit update destroy spendonenight]
layout false, only: [:hotels,:restaurants,:aliases,:dishes,:laundryjiramapeople]
  include MyhelperHelper
  before_action :allthepeople, only: %i[ workers ]
  layout false, only: %i[ workers ]
def json
@factories= Factory.findbyname(params[:name])
render json: @factories
end
  def workers
  end


def aliases
@aliases=Alias.findbyidbis(params[:id],current_user)
end
def laundryjiramapeople
@laundryjiramapeople=Laundryjiramaperson.findbyid(params[:id])
end
def dishes
@dishes=Dish.findbyid(params[:id])
end
def restaurants
@restaurants=Restaurant.findbyid(params[:id])
end
def hotels
@hotels=Hotel.findbyid(params[:id])
end
 def spendonenight
@factory.factorieshavenights.new(hotel:Hotel.new,restaurant:Restaurant.new,dish:Dish.new,laundryjiramaperson:Laundryjiramaperson.new,alias: Alias.new)
end
  # GET /factories or /factories.json
  def index
    @factories = Factory.all
  end

  # GET /factories/1 or /factories/1.json
  def show
  end

  # GET /factories/new
  def new
    @factory = Factory.new
  end

  # GET /factories/1/edit
  def edit
  end

  # POST /factories or /factories.json
  def create
    @factory = Factory.new(factory_params)

    respond_to do |format|
      if @factory.save
        format.html { redirect_to @factory, notice: "Factory was successfully created." }
        format.json { render :show, status: :created, location: @factory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @factory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factories/1 or /factories/1.json
  def update
    respond_to do |format|
      if @factory.update(factory_params)
        format.html { redirect_to @factory, notice: "Factory was successfully updated." }
        format.json { render :show, status: :ok, location: @factory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @factory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factories/1 or /factories/1.json
  def destroy
    @factory.destroy
    respond_to do |format|
      format.html { redirect_to factories_url, notice: "Factory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factory
      @factory = Factory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def factory_params
      params.require(:factory).permit(:name_fr, :name_en, :name_de, :image,:factorieshavenights_attributes=>[:hotel_id, :restaurant_id, :alias_id, :dish_id, :laundryjiramaperson_id], :worker_ids=>[])
    end
end
