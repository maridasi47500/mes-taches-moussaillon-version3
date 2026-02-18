class DishesController < ApplicationController
  before_action :set_dish, only: %i[ show edit update destroy ]

  # GET /dishes or /dishes.json
  def json
    @h=Dish.findbyname(params[:name])
    render json: @h
  end

  def index
    @dishes = Dish.all
  end
  def adddishnow
    @id=session[:idadd]
    @id=@id.to_i+1
    session[:idadd]=@id
      render layout: false

  end

  # GET /dishes/1 or /dishes/1.json
  def show
  end

  # GET /dishes/new
  def new
    @dish = Dish.new
  end

  # GET /dishes/1/edit
  def edit
    if params[:ajax]
      render layout: false
    end
  end

  # POST /dishes or /dishes.json
  def create
    @dish = Dish.new(dish_params)

    respond_to do |format|
      if params[:ajax] and @dish.save
        format.html { render @dish, layout: false, notice: "Dish was successfully updated." }
        format.json { render :show, status: :ok, location: @dish }
      elsif @dish.save
        format.html { redirect_to @dish, notice: "Dish was successfully created." }
        format.json { render :show, status: :created, location: @dish }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dishes/1 or /dishes/1.json
  def update
    respond_to do |format|
      if params[:ajax] and @dish.update(dish_params)
        format.html { render @dish, layout: false, notice: "Dish was successfully updated." }
        format.json { render :show, status: :ok, location: @dish }
      elsif @dish.update(dish_params)
        format.html { redirect_to @dish, notice: "Dish was successfully updated." }
        format.json { render :show, status: :ok, location: @dish }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dishes/1 or /dishes/1.json
  def destroy
    @dish.destroy
    respond_to do |format|
      format.html { redirect_to dishes_url, notice: "Dish was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dish_params
      params.require(:dish).permit(:image, :name_fr,:name_de,:name_en,:country_ids=>[])
    end
end
