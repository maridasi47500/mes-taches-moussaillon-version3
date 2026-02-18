class TaskactionsController < ApplicationController
include MyhelperHelper
  before_action :set_taskaction, only: %i[ show edit update destroy ]
before_action :allthepeople, only: %i[ sailors ]
layout false, only: [:json,:thingstoknow,:sailors]
def thingstoknow
@categorythings=Categorything.findbyid(params[:id])
end
def json
@t=Taskaction.findbyname(params[:name])
p @t
if @t.length > 0
render json: @t
else
 render :createtask
      

end
end
  # GET /taskactions or /taskactions.json
  def index
    @taskactions = Taskaction.all
  end

  # GET /taskactions/1 or /taskactions/1.json
  def show
  end

  # GET /taskactions/new
  def new
    @taskaction = Taskaction.new
  end

  # GET /taskactions/1/edit
  def edit
  end

  # POST /taskactions or /taskactions.json
  def create
    @taskaction = Taskaction.new(taskaction_params)

    respond_to do |format|
      if @taskaction.save
        if @taskaction.myredirect
        format.html { redirect_to @taskaction.myredirect, notice: "Taskaction was successfully created." }
        format.json { render :show, status: :created, location: @taskaction }

        else   
        format.html { redirect_to @taskaction, notice: "Taskaction was successfully created." }
        format.json { render :show, status: :created, location: @taskaction }
        end
    else
p @taskaction.errors
p @taskaction.errors
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @taskaction.errors, status: :unprocessable_entity }
      end
    end
    rescue
@taskaction = Taskaction.new("name_#{I18n.locale}" => taskaction_params[:"name_#{I18n.locale}"])
@taskaction.save
@taskaction.update(taskaction_params)
        if @taskaction.myredirect
redirect_to @taskaction.myredirect
else
redirect_to @taskaction 
end 
end

  # PATCH/PUT /taskactions/1 or /taskactions/1.json
  def update
    respond_to do |format|
      if @taskaction.update(taskaction_params)
        format.html { redirect_to @taskaction, notice: "Taskaction was successfully updated." }
        format.json { render :show, status: :ok, location: @taskaction }
      else
p @taskaction.errors
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @taskaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taskactions/1 or /taskactions/1.json
  def destroy
    @taskaction.destroy
    respond_to do |format|
      format.html { redirect_to taskactions_url, notice: "Taskaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taskaction
      @taskaction = Taskaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def taskaction_params
      params.require(:taskaction).permit(:image,:name_fr, :name_en, :name_de,:person_id,:grouptask_id,:task_id,:categorything_ids=>[],:person_ids=>[], :grouptasks=>[],:sailorjobs_attributes=>{},:grouptasks_attributes=>{})
    end
end
