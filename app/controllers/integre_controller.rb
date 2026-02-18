class IntegreController < ApplicationController
  def deletegrade
    @a=Userhavearmygrade.find(params[:id])
    @a.destroy
    respond_to do |format|
      format.html { redirect_to integrearmee_url, notice: "Armygrade was successfully destroyed from your list." }
      format.json { head :no_content }
    end

  end
  def grade
int=Armygrade.all.ids.map {|x| [params["grade#{x}.x"],x]}.select{|x|x[0]}[0][1] rescue nil
if int
Userhavearmygrade.create(user: current_user, armygrade_id: int)
end
@grades=Armygrade.all.where.not(id: current_user.armygrade_ids)


  end
  def deleteskillarmy
    @a=Userhaveskill.find(params[:id])
    @a.destroy
    respond_to do |format|
      format.html { redirect_to integrearmee_url, notice: "Skill was successfully destroyed from your list." }
      format.json { head :no_content }
    end

  end
  def skillarmy
int=Skill.all.ids.map {|x| [params["skill#{x}.x"],x]}.select{|x|x[0]}[0][1] rescue nil
if int
Userhaveskill.create(user: current_user, skill_id: int)
end
@skills=Skill.all.where.not(id: current_user.skill_ids)
  end
  def deletefamilyarmy
    @a=Userhavefamily.find(params[:id])
    @a.destroy
    respond_to do |format|
      format.html { redirect_to integrearmee_url, notice: "Family member was successfully destroyed from your playlist." }
      format.json { head :no_content }
    end

  end
  def familyarmy
int=Familylink.all.ids.map {|x| [params["family#{x}.x"],x]}.select{|x|x[0]}[0][1] rescue nil
if int
Userhavefamily.create(user: current_user,person_id: params[:personid], familylink_id: int)
end

@members=Familylink.all
  end
  def deletesongarmy
    @a=Userhavesong.find(params[:id])
    @a.destroy
    respond_to do |format|
      format.html { redirect_to integrearmee_url, notice: "Song was successfully destroyed from your playlist." }
      format.json { head :no_content }
    end

  end
  def songarmy
int=Song.all.ids.map {|x| [params["song#{x}.x"],x]}.select{|x|x[0]}[0][1] rescue nil
if int
Userhavesong.create(user: current_user, song_id: int)
end

@songs=Song.all.where.not(id: current_user.song_ids)
  end
  def deleteclothesarmy
    @a=Userhaveclothing.find(params[:id])
    @a.destroy
    respond_to do |format|
      format.html { redirect_to integrearmee_url, notice: "Clothing was successfully destroyed." }
      format.json { head :no_content }
    end

  end
  def clothesarmy
int=Clothing.all.ids.map {|x| [params["clothing#{x}.x"],x]}.select{|x|x[0]}[0][1] rescue nil
if int
Userhaveclothing.create(user: current_user, clothing_id: int)
end
@clothes=Clothing.all.where.not(id: current_user.clothing_ids)
  end
  def armee
  end
end
