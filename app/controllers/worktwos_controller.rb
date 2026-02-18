class WorktwosController < ApplicationController
  before_action :set_worktwo, only: %i[ show edit update destroy ]
layout false, only: [:tickets]
  # GET /worktwos or /worktwos.json
def tickets
@tickets=Ticket.findbyid(params[:id])
end

def worktwosjson
@worktwos=Worktwo.findbynameorlink(params[:name])
render json: @worktwos
end
def rel
@rel=Peoplerelation.findbyid(params[:id])

render layout: false
end
def personid
@people=Person.find1pplbyid(params[:id])
render layout: false
end
def otherpersonid
@people=Person.find1pplbyid(params[:id])
render layout: false
end
  def index
    @worktwos = Worktwo.all
  end

  # GET /worktwos/1 or /worktwos/1.json
  def show
  end

  # GET /worktwos/new
  def new
    @worktwo = Worktwo.new

  end

  # GET /worktwos/1/edit
  def edit
  end

  # POST /worktwos or /worktwos.json
  def create
    @worktwo = Worktwo.new(worktwo_params)

    respond_to do |format|
      if @worktwo.save
        format.html { redirect_to @worktwo, notice: "Worktwo was successfully created." }
        format.json { render :show, status: :created, location: @worktwo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @worktwo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /worktwos/1 or /worktwos/1.json
  def update
    respond_to do |format|
      if @worktwo.update(worktwo_params)
        format.html { redirect_to @worktwo, notice: "Worktwo was successfully updated." }
        format.json { render :show, status: :ok, location: @worktwo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @worktwo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worktwos/1 or /worktwos/1.json
  def destroy
    @worktwo.destroy
    respond_to do |format|
      format.html { redirect_to worktwos_url, notice: "Worktwo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worktwo
      @worktwo = Worktwo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def worktwo_params
      params.require(:worktwo).permit(:twoperson_id, :person_id, :otherperson_id, :link_id,:twoperson_attributes=>{},:ticket_ids=>[])
    end
end
