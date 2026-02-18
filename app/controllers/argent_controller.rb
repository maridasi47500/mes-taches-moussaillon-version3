class ArgentController < ApplicationController
  before_action :set_argent, only: %i[ show edit update destroy ]

  # GET /argent or /argent.json
  def index
    @argent = Argent.all
  end

  # GET /argent/1 or /argent/1.json
  def show
  end

  # GET /argent/new
  def new
    @argent = Argent.new(user_id:current_user.id,mois: DateTime.now.localtime.to_date.month)
  end

  # GET /argent/1/edit
  def edit
  end

  # POST /argent or /argent.json
  def create
    @argent = Argent.new(argent_params)

    respond_to do |format|
      if @argent.save
        format.html { redirect_to @argent, notice: "Argent was successfully created." }
        format.json { render :show, status: :created, location: @argent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @argent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /argent/1 or /argent/1.json
  def update
    respond_to do |format|
      if @argent.update(argent_params)
        format.html { redirect_to @argent, notice: "Argent was successfully updated." }
        format.json { render :show, status: :ok, location: @argent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @argent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /argent/1 or /argent/1.json
  def destroy
    @argent.destroy
    respond_to do |format|
      format.html { redirect_to argent_index_url, notice: "Argent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_argent
      @argent = Argent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def argent_params
      params.require(:argent).permit(:user_id, :mois, :annee, :paye, :apayer,:madepense=>[])
    end
end
