class SignupcomposerController < ApplicationController
    def new
    render template: "composers/registrations/new"
  end
  def edit
    @composer=Composer.find(params[:id])
    render template: "composers/registrations/edit"
  end
  def create
    @user=Composer.new(composer_params)
    if @user && @user.save
      p @user
      redirect_to songs_path
    else
    render template: "composers/registrations/new"

    end
  end
  def update
    @composer=Composer.find(params[:id])
    @composer.update(composer_params)
  end
  private
  def composer_params
    params.require(:composer).permit(:email,:password,:password_confirmation,:name)
  end

end
