class ReactionsTextsController < ApplicationController
  before_action :set_reactions_text, only: [:show, :edit, :update, :destroy]

  # GET /reactions_texts
  # GET /reactions_texts.json
  def cherchersurnames
    @surnames=Dupontsurname.where(id: params[:id])
    render layout: false
  end
  def index
      @reactions_texts=ReactionsText.bypage(params[:page].to_i)

  end

  # GET /reactions_texts/1
  # GET /reactions_texts/1.json
  def show
  end

  # GET /reactions_texts/new
  def new
    @reactions_text = ReactionsText.new
  end

  # GET /reactions_texts/1/edit
  def edit
  end

  # POST /reactions_texts
  # POST /reactions_texts.json
  def create
    @reactions_text = ReactionsText.new(reactions_text_params)

    respond_to do |format|
      if @reactions_text.save
        format.html { redirect_to @reactions_text, notice: 'text to make a sentence with sailors was successfully created.' }
        format.json { render :show, status: :created, location: @reactions_text }
      else
        format.html { render :new }
        format.json { render json: @reactions_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reactions_texts/1
  # PATCH/PUT /reactions_texts/1.json
  def update
    respond_to do |format|
      if @reactions_text.update(reactions_text_params)
        format.html { redirect_to @reactions_text, notice: 'text to make a sentence with sailors was successfully updated.' }
        format.json { render :show, status: :ok, location: @reactions_text }
      else
        format.html { render :edit }
        format.json { render json: @reactions_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reactions_texts/1
  # DELETE /reactions_texts/1.json
  def destroy
    @reactions_text.destroy
    respond_to do |format|
      format.html { redirect_to reactions_texts_url, notice: 'text to make a sentence with sailors was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reactions_text
      @reactions_text = ReactionsText.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reactions_text_params
      params.require(:reactions_text).permit(:name_fr,:name_en,:name_de)
    end
end
