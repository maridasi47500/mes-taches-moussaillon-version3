class FakecommentsController < ApplicationController
  before_action :set_fakecomment, only: [:show, :edit, :update, :destroy]
layout false

  # GET /fakecomments
  # GET /fakecomments.json
  def index
    @fakecomments = Fakecomment.all
  end

  # GET /fakecomments/1
  # GET /fakecomments/1.json
  def show
  end

  # GET /fakecomments/new
  def new
    @fakecomment = Fakecomment.new
  end
  # GET /fakecomments/new
  def courseapied
    @fakecomment = Fakecomment.find(params[:id])
	render :couseapied
  end

  # GET /fakecomments/1/edit
  def edit
  end

  # POST /fakecomments
  # POST /fakecomments.json
  def create
    @fakecomment = Fakecomment.new(fakecomment_params)

    respond_to do |format|
      if @fakecomment.save
        format.html { redirect_to @fakecomment, notice: 'Fakecomment was successfully created.' }
        format.json { render :show, status: :created, location: @fakecomment }
      else
        format.html { render :new }
        format.json { render json: @fakecomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fakecomments/1
  # PATCH/PUT /fakecomments/1.json
  def update
    respond_to do |format|
      if @fakecomment.update(fakecomment_params)
        format.html { redirect_to @fakecomment, notice: 'Fakecomment was successfully updated.' }
        format.json { render :show, status: :ok, location: @fakecomment }
      else
        format.html { render :edit }
        format.json { render json: @fakecomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fakecomments/1
  # DELETE /fakecomments/1.json
  def destroy
    @fakecomment.destroy
    respond_to do |format|
      format.html { redirect_to fakecomments_url, notice: 'Fakecomment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fakecomment
      @fakecomment = Fakecomment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fakecomment_params
      params.require(:fakecomment).permit(:author, :content)
    end
end
