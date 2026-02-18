class CategorythingsController < ApplicationController
  before_action :set_categorything, only: %i[ show edit update setqty destroy qty who]
layout false, only: [:personid,:taskid]
  def who
    @int=Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil
    @int1=Person.all.ids.map {|x| [params["#{x}task.x"],x]}.select{|x|x[0]}[0][1] rescue nil
    if @int
      @person=Person.find(@int)
    elsif @int1
      @person=Person.find(params[:personid])
      @task=Task.find(@int1)
      @t=@task.taskusedstuffs.find_or_create_by(user: current_user, thing_id: @categorything.id,use: params[:qty])
      begin
      @t.people << [@person]
      rescue ActiveRecord::RecordInvalid => e
      end
      redirect_to @categorything

    end
  end
  def taskid
  @task=Task.find(params[:id])
  end
  def personid
  @person=Person.find(params[:id])
  end
  def setqty
@int=(1..5).map {|x| [params["#{@categorything.id}categorything#{x}.x"],x]}.select{|x|x[0]}[0][1]


  end
  def qty

  end
  # GET /categorythings or /categorythings.json
  def json
   @j=Categorything.findbyname(params[:name])
   render json: @j
  end
  def index
    @categorythings = Categorything.all
  end

  # GET /categorythings/1 or /categorythings/1.json
  def show
  end

  # GET /categorythings/new
  def new
    @categorything = Categorything.new
  end

  # GET /categorythings/1/edit
  def edit
  end

  # POST /categorythings or /categorythings.json
  def create
    @categorything = Categorything.new(categorything_params)

    respond_to do |format|
      if @categorything.save
        format.html { redirect_to @categorything, notice: "Categorything was successfully created." }
        format.json { render :show, status: :created, location: @categorything }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @categorything.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categorythings/1 or /categorythings/1.json
  def update
    respond_to do |format|
      if @categorything.update(categorything_params)
        format.html { redirect_to @categorything, notice: "Categorything was successfully updated." }
        format.json { render :show, status: :ok, location: @categorything }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @categorything.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categorythings/1 or /categorythings/1.json
  def destroy
    @categorything.destroy
    respond_to do |format|
      format.html { redirect_to categorythings_url, notice: "Categorything was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categorything
      @categorything = Categorything.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def categorything_params
      params.require(:categorything).permit(:name_fr, :name_en, :name_de, :image)
    end
end
