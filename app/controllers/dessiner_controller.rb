class DessinerController < ApplicationController
layout 'html'
  def index
end
  def dessin
@post=Post.new(dessin_params)
if @post.save
render plain: post_path(@post.id)
else
render plain: dessine_path
end
  end
private
def dessin_params
params.permit(:content_fr, :content_en, :content_de, :imagesdessin)
end
end
