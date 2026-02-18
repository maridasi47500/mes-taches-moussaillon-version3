class FakecouplesController < ApplicationController
  before_action :set_fakecouple, only: %i[ show edit update destroy ]
layout false, only: [:people, :otherpeople, :people1, :otherpeople1]
before_action :get_people, only: [:people, :otherpeople, :people1, :otherpeople1]
  # GET /fakecouples or /fakecouples.json
  def index
    @fakecouples = Fakecouple.all
  end
def people
end
def otherpeople
end
def people1
end
def otherpeople1
end
  # GET /fakecouples/1 or /fakecouples/1.json
  def show
  end

  # GET /fakecouples/new
  def new
    @fakecouple = Fakecouple.new
  end

  # GET /fakecouples/1/edit
  def edit
  end

  # POST /fakecouples or /fakecouples.json
  def create
    @fakecouple = Fakecouple.new(fakecouple_params)

    respond_to do |format|
      if @fakecouple.save
        format.html { redirect_to @fakecouple, notice: "Fakecouple was successfully created." }
        format.json { render :show, status: :created, location: @fakecouple }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fakecouple.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fakecouples/1 or /fakecouples/1.json
  def update
    respond_to do |format|
      if @fakecouple.update(fakecouple_params)
        format.html { redirect_to @fakecouple, notice: "Fakecouple was successfully updated." }
        format.json { render :show, status: :ok, location: @fakecouple }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fakecouple.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fakecouples/1 or /fakecouples/1.json
  def destroy
    @fakecouple.destroy
    respond_to do |format|
      format.html { redirect_to fakecouples_url, notice: "Fakecouple was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fakecouple
      @fakecouple = Fakecouple.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fakecouple_params
      params.fetch(:fakecouple, {}).permit(:someoneelse_attributes=>{}, :otherperson_attributes=>{})
    end
    def get_people
@people=Person.findbyid(params[:id])

    end
end
