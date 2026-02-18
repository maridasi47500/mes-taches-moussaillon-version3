class MymapsController < ApplicationController
  before_action :set_mymap, only: %i[ show edit update destroy addaplace placeadded searchaplace]
def placeadded
@post=Post.find(params[:post_id])
@mymap.mymapscoords.create(tagx: params['tag.x'], tagy: params['tag.y'])
redirect_to post_mymap_path(post_id: @post.id, id: @mymap.id)
end
def addaplace
@post=Post.find(params[:post_id])
end

  # GET /mymaps or /mymaps.json
  def index
    @mymaps = Mymap.all
  end

  # GET /mymaps/1 or /mymaps/1.json
  def show
@post=Post.find(params[:post_id])
  end

  # GET /mymaps/new
  def new
    @mymap = Mymap.new
  end

  # GET /mymaps/1/edit
  def edit
  end

  # POST /mymaps or /mymaps.json
  def create
    @mymap = Mymap.new(mymap_params)

    respond_to do |format|
      if @mymap.save
        format.html { redirect_to @mymap, notice: "Mymap was successfully created." }
        format.json { render :show, status: :created, location: @mymap }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mymap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mymaps/1 or /mymaps/1.json
  def update
    respond_to do |format|
      if @mymap.update(mymap_params)
        format.html { redirect_to @mymap, notice: "Mymap was successfully updated." }
        format.json { render :show, status: :ok, location: @mymap }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mymap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mymaps/1 or /mymaps/1.json
  def destroy
    @mymap.destroy
    respond_to do |format|
      format.html { redirect_to mymaps_url, notice: "Mymap was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mymap
      @mymap = Mymap.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mymap_params
      params.require(:mymap).permit(:image, :width, :height,:mymapscoords_attributes=>{})
    end
end
