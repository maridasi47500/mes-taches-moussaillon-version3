class ComicbooksController < ApplicationController
  before_action :set_comicbook, only: %i[ show edit update destroy ]

  # GET /comicbooks or /comicbooks.json
  def index
    @comicbooks = Comicbook.all
  end

  # GET /comicbooks/1 or /comicbooks/1.json
  def show
  end

  # GET /comicbooks/new
  def new
    @comicbook = Comicbook.new
  end

  # GET /comicbooks/1/edit
  def edit
  end

  # POST /comicbooks or /comicbooks.json
  def create
    @comicbook = Comicbook.new(comicbook_params)

    respond_to do |format|
      if @comicbook.save
        format.html { redirect_to @comicbook, notice: "Comicbook was successfully created." }
        format.json { render :show, status: :created, location: @comicbook }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comicbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comicbooks/1 or /comicbooks/1.json
  def update
    respond_to do |format|
      if @comicbook.update(comicbook_params)
        format.html { redirect_to @comicbook, notice: "Comicbook was successfully updated." }
        format.json { render :show, status: :ok, location: @comicbook }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comicbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comicbooks/1 or /comicbooks/1.json
  def destroy
    @comicbook.destroy
    respond_to do |format|
      format.html { redirect_to comicbooks_url, notice: "Comicbook was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comicbook
      @comicbook = Comicbook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comicbook_params
      params.require(:comicbook).permit(:image, :title, :description)
    end
end
