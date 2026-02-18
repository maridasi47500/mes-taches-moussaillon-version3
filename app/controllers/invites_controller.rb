class InvitesController < ApplicationController
  before_action :set_invite, only: %i[ show edit update destroy ]
layout false, only: [:tasks,:people]
def tasks
@tasks = Task.findbyid(params[:id])
end
def mymessage
@message=Invitemessage.new(invitemsg_params)
end
def people
@people = Person.findbyid(params[:id])

end
def peopleform
      id=params[:id]
      @people=Person.where(id: id)
render :mypeople, layout: false

end
  # GET /invites or /invites.json
  def index
    @invites = Invite.all
  end

  # GET /invites/1 or /invites/1.json
  def show
@message=Answerinvite.new(person: current_user.aliases[0], invite:@invite)

  end

  # GET /invites/new
  def new
    @invite = Invite.new
  end

  # GET /invites/1/edit
  def edit
  end

  # POST /invites or /invites.json
  def create
    @invite = Invite.new(invite_params)

    respond_to do |format|
      if @invite.save
        format.html { redirect_to @invite, notice: "Invite was successfully created." }
        format.json { render :show, status: :created, location: @invite }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invites/1 or /invites/1.json
  def update
    respond_to do |format|
      if @invite.update(invite_params)
        format.html { redirect_to @invite, notice: "Invite was successfully updated." }
        format.json { render :show, status: :ok, location: @invite }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invites/1 or /invites/1.json
  def destroy
    @invite.destroy
    respond_to do |format|
      format.html { redirect_to invites_url, notice: "Invite was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invite
      @invite = Invite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
def invitemsg_params
      params.require(:invite).permit(:person_id,:invite_id)
end
    def invite_params
      params.require(:invite).permit(:namegroup, :vipassname, :image,:person_ids=>[],:task_ids=>[])
    end
end
