class OlympiccountriesController < ApplicationController
  def index
    @countries=Country.allolympic
  end
end
