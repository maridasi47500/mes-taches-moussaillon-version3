class ProfilepicturesController < ApplicationController
  before_action :set_profilepicture, only: %i[ mysurname show edit update destroy ]

def mypics
@pics=Profilepicture.find_by_name(params[:name])
render json: @pics
end
  # GET /profilepictures or /profilepictures.json
def mysurname
end
  def index
    @profilepictures = Profilepicture.all
  end

  # GET /profilepictures/1 or /profilepictures/1.json
  def show
    if params[:ajax]
	render @profilepicture, layout: false
end
  end

  # GET /profilepictures/new
  def new
    @profilepicture = Profilepicture.new
  end

  # GET /profilepictures/1/edit
  def edit
  end

  # POST /profilepictures or /profilepictures.json
  def create
    @profilepicture = Profilepicture.new(profilepicture_params)

    respond_to do |format|
      if @profilepicture.save
        format.html { redirect_to @profilepicture, notice: "Profilepicture was successfully created." }
        format.json { render :show, status: :created, location: @profilepicture }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profilepicture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profilepictures/1 or /profilepictures/1.json
  def update
    respond_to do |format|
      if params[:ajax] and @profilepicture.update(profilepicture_params)
        format.html { render @profilepicture.my_posts_surnames.order(id: :desc).take(1), layout: false, notice: "Profilepicture was successfully created." }
        format.json { render :show, status: :created, location: @profilepicture }
      elsif @profilepicture.update(profilepicture_params)
        format.html { redirect_to @profilepicture, notice: "Profilepicture was successfully updated." }
        format.json { render :show, status: :ok, location: @profilepicture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profilepicture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profilepictures/1 or /profilepictures/1.json
  def destroy
    @profilepicture.destroy
    respond_to do |format|
      format.html { redirect_to profilepictures_url, notice: "Profilepicture was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profilepicture
      @profilepicture = Profilepicture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:nameimage, :description,:name,:album_id , :person_ids=>[],:profilepicture_attributes=>{},:name=>{},:my_posts_surnames_attributes=>{})
    end
    def profilepicture_params
      params.require(:profilepicture).permit(:nameimage, :description,:name,:album_id , :person_ids=>[],:profilepicture_attributes=>{},:name=>{},:my_posts_surnames_attributes=>{})
    end
end
