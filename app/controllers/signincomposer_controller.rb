class SignincomposerController < ApplicationController
  def new
    render template: "composers/sessions/new"
  end
  def edit
    @composer=Composer.find(params[:id])
    render template: "composers/sessions/edit"
  end
  def create
    @user=Composer.find_by(email: composer_params[:email])
    if @user && @user.valid_password?(composer_params[:password])
      sign_in @user
      redirect_to songs_path
    else
    render template: "composers/sessions/new"

    end
  end
  def update
    @composer=Composer.find(params[:id])
    @composer.update(composer_params)
  end
  private
  def composer_params
    params.require(:composer).permit(:email,:password,:password_confirmation,:name,:image)
  end
end
