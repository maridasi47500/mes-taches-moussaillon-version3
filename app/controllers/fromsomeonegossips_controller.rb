class FromsomeonegossipsController < ApplicationController
  before_action :set_fromsomeonegossip, only: %i[ show edit update destroy ]

  # GET /fromsomeonegossips or /fromsomeonegossips.json
  def index
    @fromsomeonegossips = Fromsomeonegossip.all
  end

  # GET /fromsomeonegossips/1 or /fromsomeonegossips/1.json
  def show
    begin
      @mypeople = @fromsomeonegossip.content.split(' ').select {|x|x.length > 3}.map {|x| "%#{x.gsub(' ','%')}%".downcase}
    @mysearch=[Array.new(@mypeople.length,"lower(name) like ?").join(' or ')]+@mypeople
    @people = Person.where(*@mysearch)
    rescue => e
      p e.message
    end
  end

  # GET /fromsomeonegossips/new
  def new
    @fromsomeonegossip = Fromsomeonegossip.new
    @fromsomeonegossip.anaphors.new
  end

  # GET /fromsomeonegossips/1/edit
  def edit
        if params[:explain] == "true"
    @fromsomeonegossip.anaphors.new
    end

  end

  # POST /fromsomeonegossips or /fromsomeonegossips.json
  def create
    @fromsomeonegossip = Fromsomeonegossip.new(fromsomeonegossip_params)

    respond_to do |format|
      if @fromsomeonegossip.save
        format.html { redirect_to @fromsomeonegossip, notice: "Have you heard that, honey? #{@fromsomeonegossip.content}" }
        format.json { render :show, status: :created, location: @fromsomeonegossip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fromsomeonegossip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fromsomeonegossips/1 or /fromsomeonegossips/1.json
  def update
    respond_to do |format|
      if @fromsomeonegossip.update(fromsomeonegossip_params)
        format.html { redirect_to @fromsomeonegossip, notice: "Have you heard that, honey? #{@fromsomeonegossip.content}" }
        format.json { render :show, status: :ok, location: @fromsomeonegossip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fromsomeonegossip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fromsomeonegossips/1 or /fromsomeonegossips/1.json
  def destroy
    @fromsomeonegossip.destroy
    respond_to do |format|
      format.html { redirect_to fromsomeonegossips_url, notice: "Just forget about that." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fromsomeonegossip
      @fromsomeonegossip = Fromsomeonegossip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fromsomeonegossip_params
      params.require(:fromsomeonegossip).permit(:reaction_id,:content,:anaphors_attributes=> {})
    end
end
