class AttitudephotosController < ApplicationController
  before_action :set_attitudephoto, only: %i[ show edit update destroy ]
  layout false, only: [:traits,:attitudes,:persontraits,:personattitudes,:addtrait,:addattitude,:person1,:person2,:addtickets,:senders,:recipients]

  # GET /attitudephotos or /attitudephotos.json
  def addtickets

  end
  def addattitude

  end
  def addtrait
  end
  def recipients
@people=Person.findbyid(params[:id])
  end
  def senders
@people=Person.findbyid(params[:id])
  end
  def person2
@people=Person.findbyid(params[:id])
  end
  def person1
@people=Person.findbyid(params[:id])
  end
  def persontraits
@people=Person.findbyid(params[:id])
  end
  def personattitudes
@people=Person.findbyid(params[:id])
  end
  def traits
@traits=Trait.findbyid(params[:id])
  end
  def attitudes
@attitudes=Attitude.findbyid(params[:id])
  end
  def index
    @attitudephotos = Attitudephoto.all
  end

  # GET /attitudephotos/1 or /attitudephotos/1.json
  def show
  end

  # GET /attitudephotos/new
  def new
    @attitudephoto = Attitudephoto.new
  end

  # GET /attitudephotos/1/edit
  def edit
  end

  # POST /attitudephotos or /attitudephotos.json
  def create
    @attitudephoto = Attitudephoto.new(attitudephoto_params)

    respond_to do |format|
      if @attitudephoto.save
        format.html { redirect_to @attitudephoto, notice: "Attitudephoto was successfully created." }
        format.json { render :show, status: :created, location: @attitudephoto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attitudephoto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attitudephotos/1 or /attitudephotos/1.json
  def update
    respond_to do |format|
      if @attitudephoto.update(attitudephoto_params)
        format.html { redirect_to @attitudephoto, notice: "Attitudephoto was successfully updated." }
        format.json { render :show, status: :ok, location: @attitudephoto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attitudephoto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attitudephotos/1 or /attitudephotos/1.json
  def destroy
    @attitudephoto.destroy
    respond_to do |format|
      format.html { redirect_to attitudephotos_url, notice: "Attitudephoto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attitudephoto
      @attitudephoto = Attitudephoto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attitudephoto_params
      params.require(:attitudephoto).permit(:person1, :person2,:ageperson1,:ageperson2,:start_at, :end_at, :title_fr, :title_en, :title_de,:photopeoplehaveattitudes_attributes=>{},:photopeoplehavetraits_attributes=>{},:tickets_attributes=>{})
    end
end
