class MymenusController < ApplicationController
  before_action :set_mymenu, only: %i[ choose show edit update destroy ]
def choose
@mymenu.choicemenus.create(webpage_id: params[:webpage_ids],user_id: current_user.id) 
redirect_to mymenu_path(@mymenu.id)
end
  # GET /mymenus or /mymenus.json
  def index
    @mymenus = Mymenu.all
  end

  # GET /mymenus/1 or /mymenus/1.json
  def show
  end

  # GET /mymenus/new
  def new
    @mymenu = Mymenu.new
  end

  # GET /mymenus/1/edit
  def edit
if params[:addpage]=="true"
@mymenu.webpages.new
end
  end

  # POST /mymenus or /mymenus.json
  def create
    @mymenu = Mymenu.new(mymenu_params)

    respond_to do |format|
      if @mymenu.save
        format.html { redirect_to @mymenu, notice: "Mymenu was successfully created." }
        format.json { render :show, status: :created, location: @mymenu }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mymenu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mymenus/1 or /mymenus/1.json
  def update
    respond_to do |format|
      if @mymenu.update(mymenu_params)
        format.html { redirect_to @mymenu, notice: "Mymenu was successfully updated." }
        format.json { render :show, status: :ok, location: @mymenu }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mymenu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mymenus/1 or /mymenus/1.json
  def destroy
    @mymenu.destroy
    respond_to do |format|
      format.html { redirect_to mymenus_url, notice: "Mymenu was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mymenu
      @mymenu = Mymenu.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mymenu_params
      params.fetch(:mymenu, {}).permit(:choicemenus_attributes=>{},:webpages_attributes=>{})
    end
end
