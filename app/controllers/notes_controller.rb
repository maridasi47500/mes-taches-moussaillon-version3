class NotesController < ApplicationController
  def index
    @notes=Aidememoire.allmyaidememoires
    @notes2=Aidememoire.allmyaidememoiressuite
  end
end
