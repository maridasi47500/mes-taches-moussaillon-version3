class BarattemptsController < ApplicationController
  before_action :set_barattempt, only: %i[ show edit update destroy ]
layout false, only: [:person]
def person
@people=Person.findbyid(params[:id])

end
  # GET /barattempts or /barattempts.json
  def index
    @barattempts = Barattempt.all
  end

  # GET /barattempts/1 or /barattempts/1.json
  def show
  end

  # GET /barattempts/new
  def new
    @barattempt = Barattempt.new(bar_id:params[:barid],user_id:current_user.id)
  end

  # GET /barattempts/1/edit
  def edit
  end

  # POST /barattempts or /barattempts.json
  def create
    @barattempt = Barattempt.new(barattempt_params)

    respond_to do |format|
      if @barattempt.save
        format.html { redirect_to @barattempt, notice: "Barattempt was successfully created." }
        format.json { render :show, status: :created, location: @barattempt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @barattempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barattempts/1 or /barattempts/1.json
  def update
    respond_to do |format|
      if @barattempt.update(barattempt_params)
        format.html { redirect_to @barattempt, notice: "Barattempt was successfully updated." }
        format.json { render :show, status: :ok, location: @barattempt }
      else
p @barattempt.barreviews[0].errors
p @barattempt.errors
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @barattempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barattempts/1 or /barattempts/1.json
  def destroy
    @barattempt.destroy
    respond_to do |format|
      format.html { redirect_to barattempts_url, notice: "Barattempt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barattempt
      @barattempt = Barattempt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def barattempt_params
      params.require(:barattempt).permit(:user_id,:contentsamplerecording,:samplecontent,:sample, :score_id, :person_id, :bar_id,:samplerecording=>[],:recordingreviews_attributes=>{},:barreviews_attributes=>{})
    end
end
