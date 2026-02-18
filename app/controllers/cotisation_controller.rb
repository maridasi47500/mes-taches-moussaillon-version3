class CotisationController < ApplicationController
  def jirama
@transac=Transac.new(user:current_user)
  end
  def index
@transac=Transac.new(motif: 'cotisation',user: current_user)
  end
end
