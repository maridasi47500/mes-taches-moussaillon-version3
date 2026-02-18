class RecordingsController < ApplicationController
  before_action :set_recording, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout false, only: [:myphrases, :mynames,:myphrasesandwords,:mywords]

  # GET /recordings
  # GET /recordings.json
  def notes
  end
  def myrecord
    @task=Task.find(params[:taskid]) rescue nil
    @task||=Beach.find(params[:beachid]) rescue nil
    @task||=PostsSurname.find(params[:postssurnameid]) rescue nil
    @newrec= Recording.new
@sot=Setoftask.find(params[:setoftaskid]) rescue nil || nil
        case params[:myview]
        when 'new'
    @word=Word.new
    @phrase=Phrase.new
    @am = Recording.new

    render partial: "formrecord/record#{params[:typerecord]}", layout: false
        when 'fromother'
    @word=Word.new
    @phrase=Phrase.new
        @am1=@am = Aidememoire.find(params[:listeam]) rescue Aidememoire.new || Aidememoire.new
        @am = @am.recordedphrase 
        @am.myrelationtoselect = @am1.firstrelationid

    render partial: "formrecord/record#{params[:typerecord]}", layout: false
        when 'nextone'
    @word=Word.new
    @phrase=Phrase.new
        @am1=@am = Aidememoire.find(params[:listeam]) rescue Aidememoire.new || Aidememoire.new
        @am = @am.recordedword 
        @am.myrelationtoselect = @am1.secondrelationid

    render partial: "formrecord/record#{params[:typerecord]}", layout: false
        else
    @word=Word.new
    @phrase=Phrase.new
    @am = Recording.new
    render partial: "formrecord/record#{params[:typerecord]}", layout: false

        end
  end
  def mycontent
    @sot = Setoftask.find(params[:setoftaskid]) rescue nil || nil
    @rec = Recording.find(params[:am_id]) rescue Recording.new || Recording.new
    @myparam=params[:objectname]
 @myparam=@myparam[0]
    @fieldname=params[:fieldname][6..-1].to_s.gsub('my', 'myown')
    p @fieldname
    render layout: false
  end
  def mycontentbis
    @myparam=params[:objectname]
 @myparam=@myparam[0]
    @fieldname=params[:fieldname][6..-1].to_s.gsub('my', 'myown')
    p @fieldname
    render layout: false
  end
  def mywords
    @myparam=params[:classname].underscore
  end
  def myphrases
    
  end
  def mynames
    
  end
  def index
    @recordings = Recording.all
  end

  # GET /recordings/1
  # GET /recordings/1.json
  def show
  end

  # GET /recordings/new
  def new
    @recording = Recording.new
  end

  # GET /recordings/1/edit
  def edit
  end

  # POST /recordings
  # POST /recordings.json
  def create
    @recording = Recording.new
  files= recording_params[:recordings]
  recordings=[]
  files.each do |file|
      pathfile = file.tempfile.path
      filename =pathfile.split('/').last
      recordings.push({name: filename})
    `mv #{pathfile} #{Rails.root.to_s+"/app/assets/recordings/#{filename}"}`
  end
  newrecordings = Recording.create!(recordings) #valeur temporaire de user_id
  #.add authors here
  newrecordings.each do |rec|
   rec.authors << current_user #le user_id est envoyé automatiquement normalement
  end


    respond_to do |format|
      if newrecordings.last
        format.html { redirect_to newrecordings.last, notice: 'Recording was successfully created.' }
        format.json { render :show, status: :created, location: @recording }
      else
        format.html { render :new }
        format.json { render json: @recording.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recordings/1
  # PATCH/PUT /recordings/1.json
  def update
    respond_to do |format|
      if @recording.update(recording_params)
        format.html { redirect_to @recording, notice: 'Recording was successfully updated.' }
        format.json { render :show, status: :ok, location: @recording }
      else
        format.html { render :edit }
        format.json { render json: @recording.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recordings/1
  # DELETE /recordings/1.json
  def destroy
    @recording.destroy
    respond_to do |format|
      format.html { redirect_to recordings_url, notice: 'Recording was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recording
      @recording = Recording.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recording_params
      params.require(:recording).permit(:recordings=>[])

    end
end
