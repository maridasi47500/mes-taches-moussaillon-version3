class AlbumsController < ApplicationController
  before_action :set_album, only: %i[ show edit update destroy tagaperson tagsomeone addphotos]

  layout false, only: [:personjson,:mytaggedpeople,:person,:mytaggedthings]
  def addphotos
  end
  def mytaggedthings
    @things=Thing.findbyid(params[:id])
    
  end
  def mytaggedpeople
    @people=Person.findbyid(params[:id])
    
  end
  def tagsomeone

   @photo=Photo.find(params[:photoid])
   @g=@photo.photohavesailors.new(photo_id: params[:photoid],person_id: params[:personid],tagx: params['tag.x'],tagy: params['tag.y'])

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @album, notice: 'Photo was successfully updated.' } 
        format.json { render 'albums/show', status: :ok, location: @photo } 
      else 
        p Emotion.where(['name_en like ?','cont%'])[0]
        @g.emotion = Emotion.where(['name_en like ?','cont%'])[0]


        format.html { render 'photos/edit' } 
      end

    end
  end
  def tagaperson
  end
  # GET /albums or /albums.json

  def personjson
    @people=Person.lookforname(params[:name])
    render json: @people
  end
  def person
    @k=params[:id]
    @people=Person.where('id'=>@k)
  end
  def index
    @albums = Album.all
  end

  # GET /albums/1 or /albums/1.json
  def show
  end

  # GET /albums/new
  def new
    @album = Album.new
    @album.photos.new
  end

  # GET /albums/1/edit
  def edit
    @album.photos.new
  end

  # POST /albums or /albums.json
  def create
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: "Album was successfully created." }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1 or /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: "Album was successfully updated." }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1 or /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: "Album was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:mytitle,:person_id, :title,:photos_attributes=>{},:myphotos=>[])
    end
end
