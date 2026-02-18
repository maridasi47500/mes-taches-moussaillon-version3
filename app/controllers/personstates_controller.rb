class PersonstatesController < ApplicationController
  before_action :set_personstate, only: %i[ show edit update destroy deleteperson myperson]
 layout false, only: [:foods,:drinks,:personid]
def deleteperson
@person=Person.find(params[:id])
@fd=Thing.find(params[:fd_id])
if @fd.is_a?(Food)
h=Remedieshavefood.findby(@fd.id,@personstate.id)
i=Foodremedieshaveperson.find_by(remedieshavefood_id: h.id, person_id: @person.id)
i.destroy
elsif @fd.is_a?(Drink)
h=Remedieshavedrink.findby(@fd.id,@personstate.id)
i=Drinkremedieshaveperson.find_by(remedieshavedrink_id: h.id, person_id: @person.id)
i.destroy
end
redirect_to @personstate
end
def myperson
intdrink=Drink.all.ids.map {|x| [params["drink#{x}.x"],x]}.select{|x|x[0]}[0][1] rescue nil
intfood=Food.all.ids.map {|x| [params["food#{x}.x"],x]}.select{|x|x[0]}[0][1] rescue nil
if intdrink
h=Remedieshavedrink.findby(intdrink,@personstate.id)
end
if intfood
h=Remedieshavefood.findby(intfood,@personstate.id)
end
h.people << Person.findbyid(params[:personid])
redirect_to @personstate
rescue ActiveRecord::RecordInvalid
redirect_to @personstate

end
def personid
@people=Person.findbyid(params[:id])
end
def drinks
@drinks=Drink.findbyid(params[:id])
end
def foods
@foods=Food.findbyid(params[:id])
end
  # GET /personstates or /personstates.json
  def index
    @personstates = Personstate.all
  end

  # GET /personstates/1 or /personstates/1.json
  def show
  end

  # GET /personstates/new
  def new
    @personstate = Personstate.new
  end

  # GET /personstates/1/edit
  def edit
  end

  # POST /personstates or /personstates.json
  def create
    @personstate = Personstate.new(personstate_params)

    respond_to do |format|
      if @personstate.save
        format.html { redirect_to @personstate, notice: "Personstate was successfully created." }
        format.json { render :show, status: :created, location: @personstate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personstate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personstates/1 or /personstates/1.json
  def update
    respond_to do |format|
      if @personstate.update(personstate_params)
        format.html { redirect_to @personstate, notice: "Personstate was successfully updated." }
        format.json { render :show, status: :ok, location: @personstate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @personstate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personstates/1 or /personstates/1.json
  def destroy
    @personstate.destroy
    respond_to do |format|
      format.html { redirect_to personstates_url, notice: "Personstate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personstate
      @personstate = Personstate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def personstate_params
      params.require(:personstate).permit(:state_fr, :state_en, :state_de,:food_ids=>[],:drink_ids=>[])
    end
end
