class PhotosController < ApplicationController
  
  before_action :set_photo, only: [:show, :edit, :update, :destroy,:tagaperson,:tagsomeone,:tagathing,:tagsomething,:belongings]
  before_action :authenticate_user!
  layout false, only: [:things]
  def json
    @p=Photo.findbyname(params[:name])
    render json: @p
  end
  def things
    @things=Thing.findbyid(params[:id])
  end 
  def tagsomething

   @photo=Photo.find(params[:photoid])
   @tag=@photo.photoshavethings.new(photo_id: params[:photoid],thing_id: params[:thingid],tagx: params['tag.x'],tagy: params['tag.y'])
    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render 'show', status: :ok, location: @photo }
      elsif @tag
        format.html { render 'photos/edit' }
      else
    redirect_to @photo, notice: 'Photo not updated'
  
      end

    end
  rescue
    redirect_to @photo
  end
  def tagsomeone

   @photo=Photo.find(params[:photoid])
   @tag=@photo.photohavesailors.new(photo_id: params[:photoid],person_id: params[:personid],tagx: params['tag.x'],tagy: params['tag.y'])
    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render 'show', status: :ok, location: @photo }
      elsif @tag
        format.html { render 'photos/edit' }
      else
    redirect_to @photo, notice: 'Photo not updated'
  
      end

    end
  rescue
    redirect_to @photo
  end


  # GET /photos
  def albumemotions
    @k=params[:id]
    @emotions=Emotion.where('id'=>@k)
    render layout: false
  end
  def people
    @k=params[:id]
    @people=Person.where('id'=>@k)
    render layout: false
  end
  def albumpeople
    @k=params[:id]
    @people=Person.where('id'=>@k)
    render layout: false
  end

  # GET /photos.json
  def index
    @photos = Photo.bypage(params[:page].to_i)
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
if params[:album_id]
@album=Album.find(params[:album_id])
end
  end
  def facebook
        @photos=Photo.get_one(params[:id])
        namefile = @photos[0].split('?')[0].split('/').last
            @photosaved = Photo.find_by(name: namefile)
if !@photosaved
    if savephoto_params
      @photos = @photos.map! {|x| {savefbphoto: x}}
      
      if Photo.create!(@photos)
        redirect_to @photos[0], notice: "Votre photo a bien été enregistrée."
      end
    end
else
  redirect_to @photosaved
  end
  end
  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo=Photo.new(photo_params)
    #files = photo_params[:photos]
    #photos =[]
    #files.each do |file|
    #    pathfile = file.tempfile.path
    #    filename =pathfile.split('/').last
    #    photos.push({name: filename})
    #  `mv #{pathfile} #{Rails.root.to_s+"/app/assets/photos/#{filename}"}`
    #end
    #newphotos = Photo.create!(photos) #valeur temporaire de user_id
    ##.add authors here
    #newphotos.each do |rec|
    # rec.authors << current_user #le user_id est envoyé automatiquement normalement
    #end

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if params[:albumid].to_i > 0 && @photo.update(photo_params)
        format.html { redirect_to album_photo_url(@photo,album_id: params[:albumid]), notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      elsif params[:albumid] && @photo.update(photo_params)
        format.html { redirect_to photo_url(@photo.id), notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }


      elsif @photo.update(photo_params)
        format.html { redirect_to polymorphic_url(@photo), notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photo_params
      params.require(:photo).permit(:title, :name,:file=>{}, :photohavesailors_attributes=>{},:photocomments_attributes=>{},:sailor_ids=>[],:photos=>[],:thing_ids=>[])
    end
    def savephoto_params
      params[:savephoto]
    end
end
