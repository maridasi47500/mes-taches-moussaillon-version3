class MysurnamesController < ApplicationController
  include Devise::Controllers::Helpers
  def update
    @ps=PostsSurname.find_by(myparams)
        sign_in(@ps)
        p current_posts_surname
    redirect_to root_path
  rescue
        sign_in(@ps)
    redirect_to root_path

  end
  def signout
    if posts_surname_signed_in?
      sign_out current_posts_surname
    end
    redirect_to root_path
  end
  private
  def myparams
    params.require(:posts_surname).permit(:id)
  end
end
