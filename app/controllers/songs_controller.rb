require 'nokogiri'
require 'open-uri'
class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroyconfirm, :destroyit,:composer]
  #before_action :authenticate_composer!, only: [:composer]
  layout false, only: [:songid,:hotels,:radios, :people ]
  include MyhelperHelper
  before_action :allthepeople, only: %i[ owners people ]
  before_action :allthehotels, only: %i[ hotels ]
  before_action :alltheradios, only: %i[ radios ]
  def owners
  end
  def hotels
  end
  def radios
  end
  def people
  end



  # GET /songs
  # GET /songs.json
def refreshsongradio

#@doc=Nokogiri::XML(URI.open("https://www.mistralfm.com/rss-feed-13"))
#@doc.children[0].children[1].children[10..].map {|x|x.text}.select{|x|x.include?('mistralfm.com')}.map{|x|x.strip.squish.split('https')[0].strip.split(' - ')}.each{|a,b|Song.find_or_create_by({name_fr: b, artists: [Artist.find_or_create_by(name: a)]})}
@doc=Nokogiri::XML(URI.open("https://www.mistralfm.com/rss-feed-28"))
@doc.children[0].children[1].children.map{|h|h.text}.select{|g|g.include?('Wiki')}.map {|h|Nokogiri::HTML(h).css('p strong').map{|j|j.text}.sort_by(&:length).select{|x|Artist.findbynameins( x)}.each{|l|Artist.findbynameins( l).update(description: h)} }
@doc=Nokogiri::XML(URI.open("https://www.mistralfm.com/rss-feed-30"))
@doc.children[0].children[1].children[10..].map {|x|x.text}.select{|x|x.include?('mistralfm.com')}.map{|x|x.strip.squish.split('https')[0].strip.split(' - ')}.each{|a,b|Song.find_or_create_by({name_fr: b, artists: [Artist.find_or_create_by(name: a)]})}
@doc=Nokogiri::XML(URI.open("https://www.mistralfm.com/rss-feed-27"))
@doc.children[0].children[1].children[10..].map {|x|x.text}.select{|x|x.include?('mistralfm.com')}.map{|x|x.strip.squish.split('https')[0].strip.split(' - ')}.each{|a,b|Song.find_or_create_by({name_fr: b, artists: [Artist.find_or_create_by(name: a)]})}
redirect_to songs_path

end
  def addrefrain
    
  end
  def addcouplet
    
  end
  def addonerefrain
    @song=Song.find(paramsong[:songid]) rescue nil
    @song.enterrefrain(params[:content]) if @song
    redirect_to (@song|| addrefrain_songs_path)
  end
  def addonecouplet
    @song=Song.find(paramsong[:songid]) rescue nil
    @song.entercouplet(params[:content]) if @song
    redirect_to (@song|| addcouplet_songs_path)

  end
 def songid
 @songs=Song.findbyid(params[:id])
 end
  def json
    @s=Song.findbyname(params[:name])
    render json: @s
  end
  def mypeople
    
    @people=Person.findbyname(params[:name])
    render layout: false
  end
  def composer
    @cid=params[:compoid]
    if @cid=='new'
      @c=Musicalcomposition.create!
      @c.songs << [@song]
      @cid=@c.id
    end
    if @cid.to_s.length > 0 
    @musicalcomposition=Musicalcomposition.find(@cid) rescue nil
    end

  end
  def destroyconfirm
  end
  def destroyit
    if params[:contentid]
    @c=Content.find(params[:contentid])
    @c.destroy
    elsif params[:refrainid]
    @c=Refrain.find(params[:refrainid])
    @c.destroy
    elsif params[:coupletid]
    @c=Couplet.find(params[:coupletid])
    @c.destroy
    end
    redirect_to @song

  end
  def index
    @songs = Song.all
    @compositions = Musicalcomposition.mycompo
  end

  # GET /songs/1
  # GET /songs/1.json
  def show

  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
    if params[:ok]
      render layout: false
    end
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end
    def paramsong
      params.require(:songss).permit(:songid)
    end
    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:name, :image,:refrains_attributes=>{},:couplets_attributes=>{},:contenurefrains_attributes=>{},:contenucomporefrains_attributes=>{},:contenucompocouplets_attributes=>{},:contenucouplets_attributes=>{},:composedcontents_attributes=>{}, :artists_attributes=>{},:compohaverecipients_attributes=>{},:hotel_ids=>[],:person_ids=>[],:radio_ids=>[])
    end
end
