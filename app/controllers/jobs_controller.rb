class JobsController < ApplicationController
  before_action :set_job, only: %i[ show edit update destroy ]
layout false, only: [:people,:things]

  # GET /jobs or /jobs.json
def things
@thing=Thing.find(params[:id])
end
def json
@j=Job.findbyname(params[:name])
render json: @j
end
def people
@people=Person.findbyid(params[:id])
end
  def index
    @jobs = Job.all
  end

  # GET /jobs/1 or /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs or /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
Thing.all.each do |thing|
trouve=(1..5).map {|x| [params["#{thing.id}thing#{x}.x"],x]}.select{|x|x[0]}[0] rescue nil
val=trouve ? trouve[0] : nil
int=trouve ? trouve[1] : nil
if int && val && val != '0'
@job.jobusedstuffs.create!(user: current_user, thing_id: thing.id,use: int)
end
end

        format.html { redirect_to @job, notice: "Job was successfully created." }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1 or /jobs/1.json
  def update


    respond_to do |format|
      if @job.update(job_params)
Thing.all.each do |thing|
trouve=(1..5).map {|x| [params["#{thing.id}thing#{x}.x"],x]}.select{|x|x[0]}[0] rescue nil
val=trouve ? trouve[0] : nil
int=trouve ? trouve[1] : nil
if int && val && val != '0'
@job.jobusedstuffs.create!(user: current_user, thing_id: thing.id,use: int)
end
end
@job.jobusedstuffs.each do |t|
i= params["#{t.thing.id}nb"]
if i
t.update(nb: i)
end
end
        format.html { redirect_to @job, notice: "Job was successfully updated." }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1 or /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: "Job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:name_fr, :name_en, :name_de,:image,:person_ids => [])
    end
end
