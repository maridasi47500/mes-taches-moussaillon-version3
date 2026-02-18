class WarWeaponsController < ApplicationController
  before_action :set_war_weapon, only: %i[ show edit update destroy ]

  # GET /war_weapons or /war_weapons.json
  def index
    @war_weapons = WarWeapon.all
  end

  # GET /war_weapons/1 or /war_weapons/1.json
  def show
  end

  # GET /war_weapons/new
  def new
    @war_weapon = WarWeapon.new
  end

  # GET /war_weapons/1/edit
  def edit
  end

  # POST /war_weapons or /war_weapons.json
  def create
    @war_weapon = WarWeapon.new(war_weapon_params)

    respond_to do |format|
      if @war_weapon.save
        format.html { redirect_to @war_weapon, notice: "War weapon was successfully created." }
        format.json { render :show, status: :created, location: @war_weapon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @war_weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /war_weapons/1 or /war_weapons/1.json
  def update
    respond_to do |format|
      if @war_weapon.update(war_weapon_params)
        format.html { redirect_to @war_weapon, notice: "War weapon was successfully updated." }
        format.json { render :show, status: :ok, location: @war_weapon }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @war_weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /war_weapons/1 or /war_weapons/1.json
  def destroy
    @war_weapon.destroy
    respond_to do |format|
      format.html { redirect_to war_weapons_url, notice: "War weapon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_war_weapon
      @war_weapon = WarWeapon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def war_weapon_params
      params.require(:war_weapon).permit(:name, :image)
    end
end
