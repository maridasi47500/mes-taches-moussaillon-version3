class PostsSurnameMeaningsController < ApplicationController
  before_action :set_posts_surname_meaning, only: %i[ show edit update destroy ]

def allps
      id=params[:id]
      @posts_surnames=PostsSurname.find_by_id(id)
render layout: false
end

  # GET /posts_surname_meanings or /posts_surname_meanings.json
  def index
    @posts_surname_meanings = PostsSurnameMeaning.all
  end

  # GET /posts_surname_meanings/1 or /posts_surname_meanings/1.json
  def show
  end

  # GET /posts_surname_meanings/new
  def new
    @posts_surname_meaning = PostsSurnameMeaning.new
  end

  # GET /posts_surname_meanings/1/edit
  def edit
  end

  # POST /posts_surname_meanings or /posts_surname_meanings.json
  def create
    @posts_surname_meaning = PostsSurnameMeaning.new(posts_surname_meaning_params)

    respond_to do |format|
      if @posts_surname_meaning.save
        format.html { redirect_to @posts_surname_meaning, notice: "Posts surname meaning was successfully created." }
        format.json { render :show, status: :created, location: @posts_surname_meaning }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @posts_surname_meaning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts_surname_meanings/1 or /posts_surname_meanings/1.json
  def update
    respond_to do |format|
      if @posts_surname_meaning.update(posts_surname_meaning_params)
        format.html { redirect_to @posts_surname_meaning, notice: "Posts surname meaning was successfully updated." }
        format.json { render :show, status: :ok, location: @posts_surname_meaning }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @posts_surname_meaning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts_surname_meanings/1 or /posts_surname_meanings/1.json
  def destroy
    @posts_surname_meaning.destroy
    respond_to do |format|
      format.html { redirect_to posts_surname_meanings_url, notice: "Posts surname meaning was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_posts_surname_meaning
      @posts_surname_meaning = PostsSurnameMeaning.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def posts_surname_meaning_params
      params.require(:posts_surname_meaning).permit(:ps_id, :post_id, :surname_id, :person_id, :sailor_id, :place_id, :posts_surname_id, :thing_id, :other_posts_surname_id, :action_name, :profilepic_id, :speaklike_id, :destinataire_id, :realname_id, :fakename, :content_en, :content_fr, :content_de, :surnamedestinataire_id, :stranger_id)
    end
end
