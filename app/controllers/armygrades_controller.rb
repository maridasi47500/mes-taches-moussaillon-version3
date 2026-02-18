class ArmygradesController < ApplicationController
  before_action :set_armygrade, only: %i[ show edit update destroy ]

  def json
@j=Armygrade.findbyname(params[:name])
render json: @j
  end
  # GET /armygrades or /armygrades.json
  def usurpate
@person=Person.find(params[:person_id])
@grade=Grade.find(params[:grade_id])
@epoch=Epoch.find(params[:epoch_id])
@user=User.find(params[:user_id])
@grades=Armygrade.all
  end
  def usurpatewithgrade
@person=Person.find(params[:person_id])
@grade=Grade.find(params[:grade_id])
@epoch=Epoch.find(params[:epoch_id])
@user=User.find(params[:user_id])
int=Armygrade.all.ids.map {|x| [params["grade#{x}.x"],x]}.select{|x|x[0]}[0][1]
    @gradearmee=Armygrade.find(int)
@alias=Alias.find_or_create_by("alias" => @person, user: @user)
@laundry=Laundryjiramaperson.find_or_create_by("alias" => @alias, grade: @gradearmee )
#redirect_to usurpate_epoch_grade_person_user_armygrades_path(user_id: @user.id,grade_id:@grade.id, epoch_id:@epoch.id,person_id:@person.id), notice: "ok tu pouvais usurper #{@person.name}"
redirect_to epoch_grade_person_user_armygrade_laundryjiramaperson_path(armygrade_id: @gradearmee.id,id: @laundry.id,user_id: @user.id,grade_id:@grade.id, epoch_id:@epoch.id,person_id:@person.id), notice: "ok tu pouvais usurper #{@person.name}"
  end
  def myarmygrades
    @grade=Armygrade.all.sample
    @grades = Armygrade.all
  end
  def mysuperiorgrades
int=Armygrade.all.ids.map {|x| [params["grade#{x}.x"],x]}.select{|x|x[0]}[0][1]


    @superiorgrade=Armygrade.find(int)
    @grade=Armygrade.find(params[:gradeid])
Whoscaptain.create(grade: @grade,superiorgrade: @superiorgrade)
redirect_to myarmygrades_armygrades_path, notice: @grade.nom+' inférieur à '+@superiorgrade.nom
  end
  def appellation
@grade=Armygrade.find(params[:gradeid])
if params[:grade] && params[:grade].downcase.strip.squish == @grade.nom.downcase.strip.squish
render :appellation
elsif params[:appellation] && params[:appellation].downcase.strip.squish == @grade.appellation.strip.squish.downcase
render :femme
elsif params[:femme] && params[:femme].strip.squish.downcase == @grade.femme.strip.squish.downcase
redirect_to jeu_armygrades_path, notice: t("display.congrats")
else
redirect_to jeu_armygrades_path, notice: t("display.no")
end
  end
  def q2
int=Armygrade.all.ids.map {|x| [params["grade#{x}.x"],x]}.select{|x|x[0]}[0][1]
@grade=Armygrade.find(int)
@grade1=Armygrade.find(params[:gradeid])
if @grade == @grade1
redirect_to jeu_armygrades_path, notice: t("display.congrats")
else
redirect_to jeu_armygrades_path, notice: t("display.no1")
end

  end
  def jeu
    @grade=Armygrade.chooseone
    @grades=Armygrade.all.sample(6)
    @grade1=@grades.sample
  end
  def index
    @armygrades = Armygrade.all
  end

  # GET /armygrades/1 or /armygrades/1.json
  def show
  end

  # GET /armygrades/new
  def new
    @armygrade = Armygrade.new
  end

  # GET /armygrades/1/edit
  def edit
  end

  # POST /armygrades or /armygrades.json
  def create
    @armygrade = Armygrade.new(armygrade_params)

    respond_to do |format|
      if @armygrade.save
        format.html { redirect_to @armygrade, notice: "Armygrade was successfully created." }
        format.json { render :show, status: :created, location: @armygrade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @armygrade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /armygrades/1 or /armygrades/1.json
  def update
    respond_to do |format|
      if @armygrade.update(armygrade_params)
        format.html { redirect_to @armygrade, notice: "Armygrade was successfully updated." }
        format.json { render :show, status: :ok, location: @armygrade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @armygrade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /armygrades/1 or /armygrades/1.json
  def destroy
    @armygrade.destroy
    respond_to do |format|
      format.html { redirect_to armygrades_url, notice: "Armygrade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_armygrade
if params[:id].to_i > 0
      @armygrade = Armygrade.find(params[:id])
end
    end

    # Only allow a list of trusted parameters through.
    def armygrade_params
      params.require(:armygrade).permit(:nom, :appellation, :image,:femme,:abbreviation)
    end
end
