class DisplayusurpationController < ApplicationController
  def index

    @surnameid = params[:surname]
    @surnames = PostsSurname.find_by(id: @surnameid).posts_surnames
    respond_to do |format|
      format.js {render locals: {posts_surnames: @surnames}}
    end
  end
end
