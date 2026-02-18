class UpdateuserController < ApplicationController
    before_action :authenticate_user!, only: [:options, :editoptions]
layout false, only: [:cityid]
  def mybookings
@bookings=Mybooking.currentbookings(current_user.mybookings.as_json.pluck('id')) rescue []
  end
  def mareservation
@alias=Alias.find_or_create_by(person_id: params[:personid],user: current_user)
@city=City.find(params[:cityid])
    @hotel = Hotel.find(params[:hotelid]) rescue nil
    @resto = Restaurant.find(params[:restoid]) rescue nil
@booking=Mybooking.create(alias_id: @alias.id, city: @city, place_id: (@hotel ? @hotel.id : @resto.id),from_date: params[:du], to_date: params[:au])
p @booking.errors
    redirect_to mybookings_path
  end
  def reserver
 
@city=City.find(params[:cityid])
@sailor=Person.find(params[:personid])
    @hotelid=Hotel.all.ids.map {|x| [params["#{x}hotel.x"],x]}.select{|x|x[0]}[0][1] rescue nil
    @restoid=Restaurant.all.ids.map {|x| [params["#{x}resto.x"],x]}.select{|x|x[0]}[0][1] rescue nil
    @hotel = Hotel.find(@hotelid) rescue nil
    @resto = Restaurant.find(@restoid) rescue nil
  end

  def selectcityroom
    @cityid=City.all.ids.map {|x| [params["#{x}city.x"],x]}.select{|x|x[0]}[0][1] rescue nil
  end
  def whoid
    @personid=Person.all.ids.map {|x| [params["#{x}person.x"],x]}.select{|x|x[0]}[0][1] rescue nil

  end
  def voyageuranonyme
  end
  def cityid
    @city=City.find(params[:id])
  end
  def modify
    @user = User.find(params[:id])
    @user.update!(user_params)
  end
  def options
    if params[:changeid]
    session[:changeuserid] = changeid
    session[:recipients] = recipients
    session[:displayrecipients] = displayrecipients

    end
    if microphoneyes
    session[:microphoneyes] = microphoneyes

    end

      @changeuserid =  session[:changeuserid]
      @displayrecipients = session[:recipients]
      if @displayrecipients
        @displayrecipients.delete("")
      end
      @recipientoption = session[:displayrecipients] 
    render :editoptions
  end
  def createpers
    @pers=Person.new
    @changeuserid =  session[:changeuserid]
      render :createpers
  end
  def create
@person = Person.new(newperson)
    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  
  private
  def displayrecipients
    params[:recipients] && params[:recipients] == "false"
  end
    def recipients
    params['post'] ? params['post']['recipients'] : []
  end
  def microphoneyes
    params[:microphoneyes]
  end

  def changeid
    params[:changeid] && params[:changeid] == "false"
  end
  def user_params
    params.require(:user).permit!
  end
  def sr_document_params
  params.require(:user).permit(:image)
end
end
