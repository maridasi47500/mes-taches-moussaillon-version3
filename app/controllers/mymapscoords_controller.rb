class MymapscoordsController < ApplicationController
  before_action :set_mymapscoord, only: %i[ show edit update destroy ]

  # GET /mymapscoords or /mymapscoords.json
  def index
    @mymapscoords = Mymapscoord.all
  end

  # GET /mymapscoords/1 or /mymapscoords/1.json
  def show
@post=Post.find(params[:post_id])
@mymap=Mymap.find(params[:mymap_id])

  end

  # GET /mymapscoords/new
  def new
    @mymapscoord = Mymapscoord.new
  end

  # GET /mymapscoords/1/edit
  def edit
  end

  # POST /mymapscoords or /mymapscoords.json
  def create
    @mymapscoord = Mymapscoord.new(mymapscoord_params)

    respond_to do |format|
      if @mymapscoord.save
        format.html { redirect_to @mymapscoord, notice: "Mymapscoord was successfully created." }
        format.json { render :show, status: :created, location: @mymapscoord }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mymapscoord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mymapscoords/1 or /mymapscoords/1.json
  def update
    respond_to do |format|
      if @mymapscoord.update(mymapscoord_params)
        format.html { redirect_to @mymapscoord, notice: "Mymapscoord was successfully updated." }
        format.json { render :show, status: :ok, location: @mymapscoord }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mymapscoord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mymapscoords/1 or /mymapscoords/1.json
  def destroy
@post=Post.find(params[:post_id]) rescue nil
@mymap=Mymap.find(params[:mymap_id]) rescue nil
    @mymapscoord.destroy
    respond_to do |format|
      if @post
      format.html { redirect_to post_mymap_mymapscoord_path(post_id: @post.id,mymap_id: @mymap.id,id: @mymapscoord.id), notice: "Mymapscoord was successfully destroyed." }
      format.json { head :no_content }
      else
      format.html { redirect_to mymapscoords_url, notice: "Mymapscoord was successfully destroyed." }
      format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mymapscoord
      @mymapscoord = Mymapscoord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mymapscoord_params
      params.require(:mymapscoord).permit(:mymap_id, :tagx, :tagy)
    end
end
