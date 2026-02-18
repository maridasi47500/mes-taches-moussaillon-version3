class ThingsController < ApplicationController
  before_action :set_thing, only: [:mysurname,:removebasket, :addbasket, :show, :edit, :update, :destroy]
def json
@things=Thing.find_by_name(params[:name])
render json: @things
end
def mysurname
end
    def clearbasket
      session[:basket] = []
      session[:basketevents] = []
      @peoplebasket = Thing.where(id: session[:basket].to_a)
      @basketevents = Thing.where(id: session[:basketevents].to_a)
      render inline: "<%= render partial: 'things/displaybasket' %>"
    end
    def addbasket
      session[:basket] ||= []
      session[:basket] = session[:basket].to_a.push(@thing.id)
      @peoplebasket = Thing.where(id: session[:basket].to_a)
      render inline: "<%= render partial: 'things/displaybasket' %>"
    end
    def removebasket
      @list=session[:basket].to_a
      p @list
      @list.delete(params[:id].to_i)
      session[:basket] = @list
      p session[:basket]
      @peoplebasket = Thing.where(id: session[:basket].to_a)

      render inline: "<%= render partial: 'things/displaybasket' %>"
    end

  # GET /things
  # GET /things.json
  def index
    @things = Thing.all.where.not(type: 'Language')

  end

  # GET /things/1
  # GET /things/1.json
  def show
  end

  # GET /things/new
  def new
    @thing = Thing.new
  end

  # GET /things/1/edit
  def edit
  end

  # POST /things
  # POST /things.json
  def create
    @thing = Thing.new(thing_params)

    respond_to do |format|
      if @thing.save
        format.html { redirect_to @thing, notice: 'Thing was successfully created.' }
        format.json { render :show, status: :created, location: @thing }
      else
        format.html { render :new }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /things/1
  # PATCH/PUT /things/1.json
  def update
    respond_to do |format|
      if @thing.update(thing_params)
        format.html { redirect_to @thing, notice: 'Thing was successfully updated.' }
        format.json { render :show, status: :ok, location: @thing }
      else
        format.html { render :edit }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /things/1
  # DELETE /things/1.json
  def destroy
    @thing.destroy
    respond_to do |format|
      format.html { redirect_to things_url, notice: 'Thing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thing
      @thing = Thing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def thing_params
      params.require(:thing).permit(:name, :image)
    end
end
