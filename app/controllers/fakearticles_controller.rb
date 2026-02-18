class FakearticlesController < ApplicationController
  before_action :set_fakearticle, only: %i[ show edit update destroy fake ] 

  # GET /fakearticles or /fakearticles.json
  def fake
  @mylayout = Mylayout.find_by(typelayout: params[:layouttype])
  @localevalue=I18n.locale
  render "posts_layouts/#{@mylayout.typelayout}", layout: @mylayout.name

  end
  def index
    @fakearticles = Fakearticle.all
  end

  # GET /fakearticles/1 or /fakearticles/1.json
  def show
  end

  # GET /fakearticles/new
  def new
    @fakearticle = Fakearticle.new
  end

  # GET /fakearticles/1/edit
  def edit
  end

  # POST /fakearticles or /fakearticles.json
  def create
    @fakearticle = Fakearticle.new(fakearticle_params)

    respond_to do |format|
      if @fakearticle.save
        format.html { redirect_to @fakearticle, notice: "Fakearticle was successfully created." }
        format.json { render :show, status: :created, location: @fakearticle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fakearticle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fakearticles/1 or /fakearticles/1.json
  def update
    respond_to do |format|
      if @fakearticle.update(fakearticle_params)
        format.html { redirect_to @fakearticle, notice: "Fakearticle was successfully updated." }
        format.json { render :show, status: :ok, location: @fakearticle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fakearticle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fakearticles/1 or /fakearticles/1.json
  def destroy
    @fakearticle.destroy
    respond_to do |format|
      format.html { redirect_to fakearticles_url, notice: "Fakearticle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fakearticle
      @art=@fakearticle = Fakearticle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fakearticle_params
      params.require(:fakearticle).permit(:title, :authorname, :authorpseudo, :content, :category, :pic, :authorpic)
    end
end
