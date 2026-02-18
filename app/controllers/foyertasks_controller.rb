class FoyertasksController < ApplicationController
  before_action :set_foyertask, only: %i[ show edit update destroy ]
layout false, only: [:user2]
def user2
@people=User.findbyid(params[:id])
end
  # GET /foyertasks or /foyertasks.json
  def index
    @foyertasks = Foyertask.all
  end

  # GET /foyertasks/1 or /foyertasks/1.json
  def show
  end

  # GET /foyertasks/new
  def new
    @j=["trash.png", "wc2.jpg", "sol2.png", "vitre2.jpg", "broom1.jpg", "broom.jpg", "ustencils.jpg","food2.png"]
    @jir=@j.map{|k|k.gsub('.jpg','.x').gsub('.png','.x')}.select{|x|params[x]}
     
    @image = @j.select{|x| x.split('.')[0] == @jir[0].split('.')[0]}[0]
    @foyertask = Foyertask.new(image: @image, nomtachepasse: I18n.t('jiramapresent.'+@jir[0].gsub('.x','')),nomtache: I18n.t('jiramapresent.'+@jir[0].gsub('.x','')),user1:current_user.id)
  end

  # GET /foyertasks/1/edit
  def edit
  end

  # POST /foyertasks or /foyertasks.json
  def create
    @foyertask = Foyertask.new(foyertask_params)

    @image = @foyertask.image
@actionlaver=@foyertask.nomtachepasse


    respond_to do |format|
      if @foyertask.save
        format.html { redirect_to @foyertask, notice: "Foyertask was successfully created." }
        format.json { render :show, status: :created, location: @foyertask }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @foyertask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foyertasks/1 or /foyertasks/1.json
  def update
    respond_to do |format|
      if @foyertask.update(foyertask_params)
        format.html { redirect_to @foyertask, notice: "Foyertask was successfully updated." }
        format.json { render :show, status: :ok, location: @foyertask }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @foyertask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foyertasks/1 or /foyertasks/1.json
  def destroy
    @foyertask.destroy
    respond_to do |format|
      format.html { redirect_to foyertasks_url, notice: "Foyertask was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foyertask
      @foyertask = Foyertask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def foyertask_params
      params.require(:foyertask).permit(:user1, :user2, :task,:nomtache,:nomtachepasse,:image)
    end
end
