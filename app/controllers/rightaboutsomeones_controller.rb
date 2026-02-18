class RightaboutsomeonesController < ApplicationController
  before_action :set_rightaboutsomeone, only: %i[ show edit update destroy telltruth startgame wrongta]
layout false, only: [:newphrase, :newactionlist,:newaction,:goodgame]

  # GET /rightaboutsomeones or /rightaboutsomeones.json
  def wrongta
    p=params[:phrases].split('-').map{|x|x.to_i}
    a=params[:actions].split('-').map{|x|x.to_i}
    alla=@rightaboutsomeone.actionlist_ids.map{|x|x.to_i}
    mya=@rightaboutsomeone.trueactionlist_ids.map{|x|x.to_i}
    righta=mya & a
    wronga=(a - righta).map{|x|x.to_i}
    othera=alla - a - wronga
    ####
    allphrase=@rightaboutsomeone.phrase_ids.map{|x|x.to_i}
    myphrase=@rightaboutsomeone.truephrase_ids.map{|x|x.to_i}
    rightphrase=myphrase & p
    wrongphrase=(p - rightphrase).map{|x|x.to_i}
    otherphrase=allphrase - p - wrongphrase
    gagne=wrongphrase.length == 0 && wronga.length == 0 && ((alla.length + allphrase.length) > (otherphrase.length + othera.length))
    @value={phrase: {other: otherphrase.map{|x|x.to_i}, wrong: wrongphrase.map{|x|x.to_i}},a: {other: othera.map{|x|x.to_i}, wronga: wronga.map{|x|x.to_i}},gagne: gagne}
    p @value
    render json: @value
  rescue => e
   p e.messages

  end
  def telltruth
  end
  def index
    @rightaboutsomeones = Rightaboutsomeone.all
  end

  # GET /rightaboutsomeones/1 or /rightaboutsomeones/1.json
  def show
  end

  # GET /rightaboutsomeones/new
  def new
    @rightaboutsomeone = Rightaboutsomeone.new
  end

  # GET /rightaboutsomeones/1/edit
  def edit
  end

  # POST /rightaboutsomeones or /rightaboutsomeones.json
  def create
    @rightaboutsomeone = Rightaboutsomeone.new(rightaboutsomeone_params)

    respond_to do |format|
      if @rightaboutsomeone.save
        format.html { redirect_to @rightaboutsomeone, notice: "Rightaboutsomeone was successfully created." }
        format.json { render :show, status: :created, location: @rightaboutsomeone }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rightaboutsomeone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rightaboutsomeones/1 or /rightaboutsomeones/1.json
  def update
    respond_to do |format|
      if @rightaboutsomeone.update(rightaboutsomeone_params)
        format.html { redirect_to @rightaboutsomeone, notice: "Rightaboutsomeone was successfully updated." }
        format.json { render :show, status: :ok, location: @rightaboutsomeone }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rightaboutsomeone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rightaboutsomeones/1 or /rightaboutsomeones/1.json
  def destroy
    @rightaboutsomeone.destroy
    respond_to do |format|
      format.html { redirect_to rightaboutsomeones_url, notice: "Rightaboutsomeone was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rightaboutsomeone
      @rightaboutsomeone = Rightaboutsomeone.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rightaboutsomeone_params
      params.require(:rightaboutsomeone).permit(:question_fr, :question_en, :question_de, :description_fr, :description_en, :description_de,:actionlists_attributes=>{},:phrases_attributes=>{},:trueactionlists_attributes=>{},:truephrases_attributes=>{},:truephrase_ids=>[], :trueactionlist_ids=>[])
    end
end
